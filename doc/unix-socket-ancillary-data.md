https://www.oocities.org/margineantm/syspp/background/ancillary.html
Sending messages having attached ancillary data:
int send_message(int sock, const struct iovec *vec, int vec_size, const int *desc, int nr_desc,
		const struct ucred *cred){
	struct msghdr msg={0};
	int sndret;

	if(vec==NULL || vec_size<1) return -EINVAL;
	if(nr_desc<0 || nr_desc>MAX_NR_OF_DESCRIPTORS) return -EINVAL;
	if(desc==NULL) nr_desc=0;

	msg.msg_iov=(struct iovec *)vec;
	msg.msg_iovlen=vec_size;

/* sending ancillary data */
	if( cred != NULL || nr_desc > 0){
		int desclen=0;
		int credlen=0;
		struct cmsghdr *cmsg=NULL;
		char buff[CMSG_SPACE(sizeof(int)*MAX_NR_OF_DESCRIPTORS)+CMSG_SPACE(sizeof(struct ucred))]={0};

		msg.msg_control=buff;
		msg.msg_controllen=sizeof(buff);
		cmsg=CMSG_FIRSTHDR(&msg);
		if(cmsg==NULL) return -EINVAL;

	/* packing credentials */
		if(cred != NULL){
			cmsg->cmsg_level=SOL_SOCKET;
			cmsg->cmsg_type=SCM_CREDENTIALS;
			credlen=cmsg->cmsg_len=CMSG_LEN(sizeof(struct ucred));
			memcpy((int *)CMSG_DATA(cmsg),desc,sizeof(struct ucred));
			cmsg=CMSG_NXTHDR(&msg,cmsg);
		};

	/* packing files descriptors */
		if(nr_desc>0){
			cmsg->cmsg_level=SOL_SOCKET;
			cmsg->cmsg_type=SCM_RIGHTS;
			desclen=cmsg->cmsg_len=CMSG_LEN(sizeof(int)*nr_desc);
			memcpy((int *)CMSG_DATA(cmsg),desc,sizeof(int)*nr_desc);
			cmsg=CMSG_NXTHDR(&msg,cmsg);
		}

		/* finished packing updating the corect length */
		msg.msg_controllen=desclen+credlen;
	} else{
		msg.msg_control=NULL;
		msg.msg_controllen=0;
	};

	sndret=sendmsg(sock,&msg,0);
	if(sndret<0) return -errno;
	else return sndret;
}

       
Receiving messages having attached ancillary data:

static int get_descriptors(struct cmsghdr *cmsg,struct msghdr *msg,int *fds, int maxdesc){
	int retnr=0;
	if(cmsg==NULL || msg==NULL) return 0;
	if(cmsg->cmsg_type!=SCM_RIGHTS) return 0;

	if(msg->msg_controllen>0) {
		int nrdesc;
		int firstReceived;
		int payload=cmsg->cmsg_len-sizeof(*cmsg);
		int *recvdesc=(int *)CMSG_DATA(cmsg);
		int i;

		nrdesc=payload/sizeof(int);
		retnr=nrdesc0) *fds++=*recvdesc++;
			else close(*recvdesc++);
		};
	};
	return retnr;
}

static int get_credentials(struct cmsghdr *cmsg,struct msghdr *msg, struct ucred *cred){
	if(cmsg==NULL || msg==NULL || cred==NULL) return -EINVAL;
	if(cmsg->cmsg_type!=SCM_CREDENTIALS) return -EINVAL;
	if(cmsg->cmsg_len>0){
		void *recvcred=(struct ucred *)CMSG_DATA(cmsg);
		if(recvcred !=NULL)
			memcpy(cred,recvcred,sizeof(struct ucred));
	};
	return cmsg->cmsg_len;
}


int recv_message(int sock, struct iovec *vec, int vec_max_size, int *vec_size,
					int  *desc, int max_nr_desc, int *nr_desc,
					struct ucred *cred){

	char buff[CMSG_SPACE(sizeof(int)*MAX_NR_OF_DESCRIPTORS)+CMSG_SPACE(sizeof(struct ucred))]={0};
	struct msghdr msg={0};
	struct cmsghdr *cmsg=NULL;
	int ret;

	if(vec==NULL || vec_max_size<1 || vec_size==NULL)  return -EINVAL;
	msg.msg_iov=vec;
	msg.msg_iovlen=vec_max_size;
	msg.msg_control=buff;
	msg.msg_controllen=sizeof(buff);

	ret=recvmsg(sock,&msg,0);
	if(ret<0) return -errno;
	*vec_size=msg.msg_iovlen;

/* get the ANCILLARY data */
	cmsg=CMSG_FIRSTHDR(&msg);
	if(cmsg==NULL){
		if(nr_desc !=NULL) *nr_desc=0;
	} else{
		int iter=0;
		int fdnum;

		for(;cmsg !=NULL;cmsg=CMSG_NXTHDR(&msg,cmsg),iter++){
			switch(cmsg->cmsg_type){
			case SCM_RIGHTS:
				if(desc !=NULL)
					fdnum=get_descriptors(cmsg,&msg,desc,MAX_NR_OF_DESCRIPTORS);
				if(nr_desc !=NULL) *nr_desc=fdnum;
				break;
			case SCM_CREDENTIALS:
				if(cred!=NULL)
					get_credentials(cmsg,&msg,cred);
				break;
			};
		};
	}
	return ret;
}
