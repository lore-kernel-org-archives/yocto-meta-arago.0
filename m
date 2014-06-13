Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8878452A79
	for <meta-arago@arago-project.org>;
	Fri, 13 Jun 2014 19:36:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5DJaT9D030902
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 14:36:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5DJaTuf026740
	for <meta-arago@arago-project.org>; Fri, 13 Jun 2014 14:36:29 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 13 Jun 2014 14:36:29 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] yavta: append yavta recipe to update
	to	latest
Thread-Index: AQHPhzquniab/0OR4EmvBaRf/ZOvhZtvbaIg
Date: Fri, 13 Jun 2014 19:36:28 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D03BC@DFLE08.ent.ti.com>
References: <1402686416-8127-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1402686416-8127-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] yavta: append yavta recipe to update to	latest
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 19:36:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 13, 2014 2:07 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 1/2] yavta: append yavta recipe to update to
> latest
>=20
> * Append the yavta recipe found in:
>      meta-openembedded/meta-oe/recipes-multimedia/v4l2apps
>   to update it to the latest sources and update the applied
>   patch to work with those sources.
>=20
> * This brings this recipe into line with mainline commit
>   bbc32a09b2b6a16d72331026d044eb4bfe17a4c5 and this bbappend
>   can be removed once meta-arago moves to the 1.7 release of
>   the Yocto project.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  ...mode-to-allow-streaming-over-the-network-.patch |  961
> ++++++++++++++++++++
>  .../recipes-multimedia/v4l2apps/yavta_git.bbappend |   12 +
>  2 files changed, 973 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-
> multimedia/v4l2apps/yavta/0001-Add-stdout-mode-to-allow-streaming-over-
> the-network-.patch
>  create mode 100644 meta-arago-extras/recipes-
> multimedia/v4l2apps/yavta_git.bbappend
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Add=
-
> stdout-mode-to-allow-streaming-over-the-network-.patch b/meta-arago-
> extras/recipes-multimedia/v4l2apps/yavta/0001-Add-stdout-mode-to-allow-
> streaming-over-the-network-.patch
> new file mode 100644
> index 0000000..41a5dbf
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta/0001-Add-stdou
> +++ t-mode-to-allow-streaming-over-the-network-.patch
> @@ -0,0 +1,961 @@
> +From 141d3b3593722eb3d588e7c4b1542f810bc25853 Mon Sep 17 00:00:00
> 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 5 Jun 2014 11:29:20 -0500
> +Subject: [PATCH] Add stdout mode to allow streaming over the network
> +with nc
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> +---
> + yavta.c |  315
> +++++++++++++++++++++++++++++++++++-----------------------------
> + 1 file changed, 169 insertions(+), 146 deletions(-)
> +
> +diff --git a/yavta.c b/yavta.c
> +index 32adc26..b398da0 100644
> +--- a/yavta.c
> ++++ b/yavta.c
> +@@ -309,7 +309,7 @@ static bool video_has_fd(struct device *dev)
> +static int video_set_fd(struct device *dev, int fd)  {
> + 	if (video_has_fd(dev)) {
> +-		printf("Can't set fd (already open).\n");
> ++		fprintf(stderr, "Can't set fd (already open).\n");
> + 		return -1;
> + 	}
> +
> +@@ -321,18 +321,18 @@ static int video_set_fd(struct device *dev, int
> +fd)  static int video_open(struct device *dev, const char *devname)  {
> + 	if (video_has_fd(dev)) {
> +-		printf("Can't open device (already open).\n");
> ++		fprintf(stderr, "Can't open device (already open).\n");
> + 		return -1;
> + 	}
> +
> + 	dev->fd =3D open(devname, O_RDWR);
> + 	if (dev->fd < 0) {
> +-		printf("Error opening device %s: %s (%d).\n", devname,
> ++		fprintf(stderr, "Error opening device %s: %s (%d).\n",
> devname,
> + 		       strerror(errno), errno);
> + 		return dev->fd;
> + 	}
> +
> +-	printf("Device %s opened.\n", devname);
> ++	fprintf(stderr, "Device %s opened.\n", devname);
> +
> + 	dev->opened =3D 1;
> +
> +@@ -352,7 +352,7 @@ static int video_querycap(struct device *dev,
> unsigned int *capabilities)
> + 	*capabilities =3D cap.capabilities & V4L2_CAP_DEVICE_CAPS
> + 		     ? cap.device_caps : cap.capabilities;
> +
> +-	printf("Device `%s' on `%s' is a video %s (%s mplanes) device.\n",
> ++	fprintf(stderr, "Device `%s' on `%s' is a video %s (%s mplanes)
> ++device.\n",
> + 		cap.card, cap.bus_info,
> + 		video_is_capture(dev) ? "capture" : "output",
> + 		video_is_mplane(dev) ? "with" : "without"); @@ -370,7 +370,7
> @@
> +static int cap_get_buf_type(unsigned int capabilities)
> + 	} else if (capabilities & V4L2_CAP_VIDEO_OUTPUT) {
> + 		return V4L2_BUF_TYPE_VIDEO_OUTPUT;
> + 	} else {
> +-		printf("Device supports neither capture nor output.\n");
> ++		fprintf(stderr, "Device supports neither capture nor
> output.\n");
> + 		return -EINVAL;
> + 	}
> +
> +@@ -440,7 +440,7 @@ static int get_control(struct device *dev, unsigned =
int
> id, int type,
> + 		}
> + 	}
> +
> +-	printf("unable to get control 0x%8.8x: %s (%d).\n",
> ++	fprintf(stderr, "unable to get control 0x%8.8x: %s (%d).\n",
> + 		id, strerror(errno), errno);
> + 	return -1;
> + }
> +@@ -484,12 +484,12 @@ static void set_control(struct device *dev,
> unsigned int id, int type,
> + 			val =3D old.value;
> + 	}
> + 	if (ret =3D=3D -1) {
> +-		printf("unable to set control 0x%8.8x: %s (%d).\n",
> ++		fprintf(stderr, "unable to set control 0x%8.8x: %s (%d).\n",
> + 			id, strerror(errno), errno);
> + 		return;
> + 	}
> +
> +-	printf("Control 0x%08x set to %" PRId64 ", is %" PRId64 "\n",
> ++	fprintf(stderr, "Control 0x%08x set to %" PRId64 ", is %" PRId64
> ++"\n",
> + 	       id, old_val, val);
> + }
> +
> +@@ -504,7 +504,7 @@ static int video_get_format(struct device *dev)
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_G_FMT, &fmt);
> + 	if (ret < 0) {
> +-		printf("Unable to get format: %s (%d).\n", strerror(errno),
> ++		fprintf(stderr, "Unable to get format: %s (%d).\n",
> strerror(errno),
> + 			errno);
> + 		return ret;
> + 	}
> +@@ -514,7 +514,7 @@ static int video_get_format(struct device *dev)
> + 		dev->height =3D fmt.fmt.pix_mp.height;
> + 		dev->num_planes =3D fmt.fmt.pix_mp.num_planes;
> +
> +-		printf("Video format: %s (%08x) %ux%u field %s, %u planes:
> \n",
> ++	    fprintf(stderr, "Video format: %s (%08x) %ux%u field %s, %u
> ++planes: \n",
> + 			v4l2_format_name(fmt.fmt.pix_mp.pixelformat),
> fmt.fmt.pix_mp.pixelformat,
> + 			fmt.fmt.pix_mp.width, fmt.fmt.pix_mp.height,
> + 			v4l2_field_name(fmt.fmt.pix_mp.field),
> +@@ -527,7 +527,7 @@ static int video_get_format(struct device *dev)
> +
> 	fmt.fmt.pix_mp.plane_fmt[i].bytesperline ?
> +
> 	fmt.fmt.pix_mp.plane_fmt[i].sizeimage : 0;
> +
> +-			printf(" * Stride %u, buffer size %u\n",
> ++			fprintf(stderr, " * Stride %u, buffer size %u\n",
> + 				fmt.fmt.pix_mp.plane_fmt[i].bytesperline,
> + 				fmt.fmt.pix_mp.plane_fmt[i].sizeimage);
> + 		}
> +@@ -539,7 +539,7 @@ static int video_get_format(struct device *dev)
> + 		dev->plane_fmt[0].bytesperline =3D fmt.fmt.pix.bytesperline;
> + 		dev->plane_fmt[0].sizeimage =3D fmt.fmt.pix.bytesperline ?
> +fmt.fmt.pix.sizeimage : 0;
> +
> +-		printf("Video format: %s (%08x) %ux%u (stride %u) field %s
> buffer size %u\n",
> ++		fprintf(stderr, "Video format: %s (%08x) %ux%u (stride %u)
> field %s
> ++buffer size %u\n",
> + 			v4l2_format_name(fmt.fmt.pix.pixelformat),
> fmt.fmt.pix.pixelformat,
> + 			fmt.fmt.pix.width, fmt.fmt.pix.height,
> fmt.fmt.pix.bytesperline,
> + 			v4l2_field_name(fmt.fmt.pix_mp.field),
> +@@ -581,25 +581,25 @@ static int video_set_format(struct device *dev,
> +unsigned int w, unsigned int h,
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_S_FMT, &fmt);
> + 	if (ret < 0) {
> +-		printf("Unable to set format: %s (%d).\n", strerror(errno),
> ++		fprintf(stderr, "Unable to set format: %s (%d).\n",
> strerror(errno),
> + 			errno);
> + 		return ret;
> + 	}
> +
> + 	if (video_is_mplane(dev)) {
> +-		printf("Video format set: %s (%08x) %ux%u field %s, %u
> planes: \n",
> ++		fprintf(stderr, "Video format set: %s (%08x) %ux%u field %s,
> %u
> ++planes: \n",
> + 			v4l2_format_name(fmt.fmt.pix_mp.pixelformat),
> fmt.fmt.pix_mp.pixelformat,
> + 			fmt.fmt.pix_mp.width, fmt.fmt.pix_mp.height,
> + 			v4l2_field_name(fmt.fmt.pix_mp.field),
> + 			fmt.fmt.pix_mp.num_planes);
> +
> + 		for (i =3D 0; i < fmt.fmt.pix_mp.num_planes; i++) {
> +-			printf(" * Stride %u, buffer size %u\n",
> ++			fprintf(stderr, " * Stride %u, buffer size %u\n",
> + 				fmt.fmt.pix_mp.plane_fmt[i].bytesperline,
> + 				fmt.fmt.pix_mp.plane_fmt[i].sizeimage);
> + 		}
> + 	} else {
> +-		printf("Video format set: %s (%08x) %ux%u (stride %u) field %s
> buffer size %u\n",
> ++		fprintf(stderr, "Video format set: %s (%08x) %ux%u (stride %u)
> field
> ++%s buffer size %u\n",
> + 			v4l2_format_name(fmt.fmt.pix.pixelformat),
> fmt.fmt.pix.pixelformat,
> + 			fmt.fmt.pix.width, fmt.fmt.pix.height,
> fmt.fmt.pix.bytesperline,
> + 			v4l2_field_name(fmt.fmt.pix.field),
> +@@ -619,16 +619,16 @@ static int video_set_framerate(struct device
> +*dev, struct v4l2_fract *time_per_f
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_G_PARM, &parm);
> + 	if (ret < 0) {
> +-		printf("Unable to get frame rate: %s (%d).\n",
> ++		fprintf(stderr, "Unable to get frame rate: %s (%d).\n",
> + 			strerror(errno), errno);
> + 		return ret;
> + 	}
> +
> +-	printf("Current frame rate: %u/%u\n",
> ++	fprintf(stderr, "Current frame rate: %u/%u\n",
> + 		parm.parm.capture.timeperframe.numerator,
> + 		parm.parm.capture.timeperframe.denominator);
> +
> +-	printf("Setting frame rate to: %u/%u\n",
> ++	fprintf(stderr, "Setting frame rate to: %u/%u\n",
> + 		time_per_frame->numerator,
> + 		time_per_frame->denominator);
> +
> +@@ -637,19 +637,19 @@ static int video_set_framerate(struct device
> +*dev, struct v4l2_fract *time_per_f
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_S_PARM, &parm);
> + 	if (ret < 0) {
> +-		printf("Unable to set frame rate: %s (%d).\n", strerror(errno),
> ++		fprintf(stderr, "Unable to set frame rate: %s (%d).\n",
> ++strerror(errno),
> + 			errno);
> + 		return ret;
> + 	}
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_G_PARM, &parm);
> + 	if (ret < 0) {
> +-		printf("Unable to get frame rate: %s (%d).\n", strerror(errno),
> ++		fprintf(stderr, "Unable to get frame rate: %s (%d).\n",
> ++strerror(errno),
> + 			errno);
> + 		return ret;
> + 	}
> +
> +-	printf("Frame rate set: %u/%u\n",
> ++	fprintf(stderr, "Frame rate set: %u/%u\n",
> + 		parm.parm.capture.timeperframe.numerator,
> + 		parm.parm.capture.timeperframe.denominator);
> + 	return 0;
> +@@ -674,7 +674,7 @@ static int video_buffer_mmap(struct device *dev,
> struct buffer *buffer,
> + 		buffer->mem[i] =3D mmap(0, length, PROT_READ | PROT_WRITE,
> MAP_SHARED,
> + 				      dev->fd, offset);
> + 		if (buffer->mem[i] =3D=3D MAP_FAILED) {
> +-			printf("Unable to map buffer %u/%u: %s (%d)\n",
> ++			fprintf(stderr, "Unable to map buffer %u/%u: %s
> (%d)\n",
> + 			       buffer->idx, i, strerror(errno), errno);
> + 			return -1;
> + 		}
> +@@ -682,7 +682,7 @@ static int video_buffer_mmap(struct device *dev,
> struct buffer *buffer,
> + 		buffer->size[i] =3D length;
> + 		buffer->padding[i] =3D 0;
> +
> +-		printf("Buffer %u/%u mapped at address %p.\n",
> ++		fprintf(stderr, "Buffer %u/%u mapped at address %p.\n",
> + 		       buffer->idx, i, buffer->mem[i]);
> + 	}
> +
> +@@ -697,7 +697,7 @@ static int video_buffer_munmap(struct device *dev,
> struct buffer *buffer)
> + 	for (i =3D 0; i < dev->num_planes; i++) {
> + 		ret =3D munmap(buffer->mem[i], buffer->size[i]);
> + 		if (ret < 0) {
> +-			printf("Unable to unmap buffer %u/%u: %s (%d)\n",
> ++			fprintf(stderr, "Unable to unmap buffer %u/%u: %s
> (%d)\n",
> + 			       buffer->idx, i, strerror(errno), errno);
> + 		}
> +
> +@@ -725,7 +725,7 @@ static int video_buffer_alloc_userptr(struct device
> *dev, struct buffer *buffer,
> + 		ret =3D posix_memalign(&buffer->mem[i], page_size,
> + 				     length + offset + padding);
> + 		if (ret < 0) {
> +-			printf("Unable to allocate buffer %u/%u (%d)\n",
> ++			fprintf(stderr, "Unable to allocate buffer %u/%u
> (%d)\n",
> + 			       buffer->idx, i, ret);
> + 			return -ENOMEM;
> + 		}
> +@@ -734,7 +734,7 @@ static int video_buffer_alloc_userptr(struct device
> *dev, struct buffer *buffer,
> + 		buffer->size[i] =3D length;
> + 		buffer->padding[i] =3D padding;
> +
> +-		printf("Buffer %u/%u allocated at address %p.\n",
> ++		fprintf(stderr, "Buffer %u/%u allocated at address %p.\n",
> + 		       buffer->idx, i, buffer->mem[i]);
> + 	}
> +
> +@@ -809,12 +809,12 @@ static int video_alloc_buffers(struct device
> +*dev, int nbufs,
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_REQBUFS, &rb);
> + 	if (ret < 0) {
> +-		printf("Unable to request buffers: %s (%d).\n", strerror(errno),
> ++		fprintf(stderr, "Unable to request buffers: %s (%d).\n",
> ++strerror(errno),
> + 			errno);
> + 		return ret;
> + 	}
> +
> +-	printf("%u buffers requested.\n", rb.count);
> ++	fprintf(stderr, "%u buffers requested.\n", rb.count);
> +
> + 	buffers =3D malloc(rb.count * sizeof buffers[0]);
> + 	if (buffers =3D=3D NULL)
> +@@ -835,12 +835,12 @@ static int video_alloc_buffers(struct device
> +*dev, int nbufs,
> +
> + 		ret =3D ioctl(dev->fd, VIDIOC_QUERYBUF, &buf);
> + 		if (ret < 0) {
> +-			printf("Unable to query buffer %u: %s (%d).\n", i,
> ++			fprintf(stderr, "Unable to query buffer %u: %s
> (%d).\n", i,
> + 				strerror(errno), errno);
> + 			return ret;
> + 		}
> + 		get_ts_flags(buf.flags, &ts_type, &ts_source);
> +-		printf("length: %u offset: %u timestamp type/source:
> %s/%s\n",
> ++		fprintf(stderr, "length: %u offset: %u timestamp type/source:
> ++%s/%s\n",
> + 		       buf.length, buf.m.offset, ts_type, ts_source);
> +
> + 		buffers[i].idx =3D i;
> +@@ -899,12 +899,12 @@ static int video_free_buffers(struct device *dev)
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_REQBUFS, &rb);
> + 	if (ret < 0) {
> +-		printf("Unable to release buffers: %s (%d).\n",
> ++		fprintf(stderr, "Unable to release buffers: %s (%d).\n",
> + 			strerror(errno), errno);
> + 		return ret;
> + 	}
> +
> +-	printf("%u buffers released.\n", dev->nbufs);
> ++	fprintf(stderr, "%u buffers released.\n", dev->nbufs);
> +
> + 	free(dev->buffers);
> + 	dev->nbufs =3D 0;
> +@@ -974,7 +974,7 @@ static int video_queue_buffer(struct device *dev,
> +int index, enum buffer_fill_mo
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_QBUF, &buf);
> + 	if (ret < 0)
> +-		printf("Unable to queue buffer: %s (%d).\n",
> ++		fprintf(stderr, "Unable to queue buffer: %s (%d).\n",
> + 			strerror(errno), errno);
> +
> + 	return ret;
> +@@ -987,7 +987,7 @@ static int video_enable(struct device *dev, int
> +enable)
> +
> + 	ret =3D ioctl(dev->fd, enable ? VIDIOC_STREAMON : VIDIOC_STREAMOFF,
> &type);
> + 	if (ret < 0) {
> +-		printf("Unable to %s streaming: %s (%d).\n",
> ++		fprintf(stderr, "Unable to %s streaming: %s (%d).\n",
> + 			enable ? "start" : "stop", strerror(errno), errno);
> + 		return ret;
> + 	}
> +@@ -1009,10 +1009,10 @@ static void video_query_menu(struct device
> *dev, struct v4l2_queryctrl *query,
> + 			continue;
> +
> + 		if (query->type =3D=3D V4L2_CTRL_TYPE_MENU)
> +-			printf("  %u: %.32s%s\n", menu.index, menu.name,
> ++			fprintf(stderr, "  %u: %.32s%s\n", menu.index,
> menu.name,
> + 			       menu.index =3D=3D value ? " (*)" : "");
> + 		else
> +-			printf("  %u: %lld%s\n", menu.index, menu.value,
> ++			fprintf(stderr, "  %u: %lld%s\n", menu.index,
> menu.value,
> + 			       menu.index =3D=3D value ? " (*)" : "");
> + 	};
> + }
> +@@ -1043,7 +1043,7 @@ static void video_list_controls(struct device *dev=
)
> + 			continue;
> +
> + 		if (query.type =3D=3D V4L2_CTRL_TYPE_CTRL_CLASS) {
> +-			printf("--- %s (class 0x%08x) ---\n", query.name,
> query.id);
> ++			fprintf(stderr, "--- %s (class 0x%08x) ---\n",
> query.name,
> ++query.id);
> + 			continue;
> + 		}
> +
> +@@ -1053,7 +1053,7 @@ static void video_list_controls(struct device *dev=
)
> + 		else
> + 			sprintf(value, "%" PRId64, val64);
> +
> +-		printf("control 0x%08x `%s' min %d max %d step %d default
> %d current %s.\n",
> ++		fprintf(stderr, "control 0x%08x `%s' min %d max %d step %d
> default
> ++%d current %s.\n",
> + 			query.id, query.name, query.minimum,
> query.maximum,
> + 			query.step, query.default_value, value);
> +
> +@@ -1065,9 +1065,9 @@ static void video_list_controls(struct device *dev=
)
> + 	}
> +
> + 	if (nctrls)
> +-		printf("%u control%s found.\n", nctrls, nctrls > 1 ? "s" : "");
> ++		fprintf(stderr, "%u control%s found.\n", nctrls, nctrls > 1 ? "s" :
> ++"");
> + 	else
> +-		printf("No control found.\n");
> ++		fprintf(stderr, "No control found.\n");
> + }
> +
> + static void video_enum_frame_intervals(struct device *dev, __u32
> +pixelformat, @@ -1088,30 +1088,30 @@ static void
> video_enum_frame_intervals(struct device *dev, __u32 pixelformat,
> + 			break;
> +
> + 		if (i !=3D ival.index)
> +-			printf("Warning: driver returned wrong ival index "
> ++			fprintf(stderr, "Warning: driver returned wrong ival
> index "
> + 				"%u.\n", ival.index);
> + 		if (pixelformat !=3D ival.pixel_format)
> +-			printf("Warning: driver returned wrong ival pixel "
> ++			fprintf(stderr, "Warning: driver returned wrong ival
> pixel "
> + 				"format %08x.\n", ival.pixel_format);
> + 		if (width !=3D ival.width)
> +-			printf("Warning: driver returned wrong ival width "
> ++			fprintf(stderr, "Warning: driver returned wrong ival
> width "
> + 				"%u.\n", ival.width);
> + 		if (height !=3D ival.height)
> +-			printf("Warning: driver returned wrong ival height "
> ++			fprintf(stderr, "Warning: driver returned wrong ival
> height "
> + 				"%u.\n", ival.height);
> +
> + 		if (i !=3D 0)
> +-			printf(", ");
> ++			fprintf(stderr, ", ");
> +
> + 		switch (ival.type) {
> + 		case V4L2_FRMIVAL_TYPE_DISCRETE:
> +-			printf("%u/%u",
> ++			fprintf(stderr, "%u/%u",
> + 				ival.discrete.numerator,
> + 				ival.discrete.denominator);
> + 			break;
> +
> + 		case V4L2_FRMIVAL_TYPE_CONTINUOUS:
> +-			printf("%u/%u - %u/%u",
> ++			fprintf(stderr, "%u/%u - %u/%u",
> + 				ival.stepwise.min.numerator,
> + 				ival.stepwise.min.denominator,
> + 				ival.stepwise.max.numerator,
> +@@ -1119,7 +1119,7 @@ static void video_enum_frame_intervals(struct
> device *dev, __u32 pixelformat,
> + 			return;
> +
> + 		case V4L2_FRMIVAL_TYPE_STEPWISE:
> +-			printf("%u/%u - %u/%u (by %u/%u)",
> ++			fprintf(stderr, "%u/%u - %u/%u (by %u/%u)",
> + 				ival.stepwise.min.numerator,
> + 				ival.stepwise.min.denominator,
> + 				ival.stepwise.max.numerator,
> +@@ -1149,23 +1149,23 @@ static void video_enum_frame_sizes(struct
> device *dev, __u32 pixelformat)
> + 			break;
> +
> + 		if (i !=3D frame.index)
> +-			printf("Warning: driver returned wrong frame index "
> ++			fprintf(stderr, "Warning: driver returned wrong frame
> index "
> + 				"%u.\n", frame.index);
> + 		if (pixelformat !=3D frame.pixel_format)
> +-			printf("Warning: driver returned wrong frame pixel "
> ++			fprintf(stderr, "Warning: driver returned wrong frame
> pixel "
> + 				"format %08x.\n", frame.pixel_format);
> +
> + 		switch (frame.type) {
> + 		case V4L2_FRMSIZE_TYPE_DISCRETE:
> +-			printf("\tFrame size: %ux%u (", frame.discrete.width,
> ++			fprintf(stderr, "\tFrame size: %ux%u (",
> frame.discrete.width,
> + 				frame.discrete.height);
> + 			video_enum_frame_intervals(dev,
> frame.pixel_format,
> + 				frame.discrete.width, frame.discrete.height);
> +-			printf(")\n");
> ++			fprintf(stderr, ")\n");
> + 			break;
> +
> + 		case V4L2_FRMSIZE_TYPE_CONTINUOUS:
> +-			printf("\tFrame size: %ux%u - %ux%u (",
> ++			fprintf(stderr, "\tFrame size: %ux%u - %ux%u (",
> + 				frame.stepwise.min_width,
> + 				frame.stepwise.min_height,
> + 				frame.stepwise.max_width,
> +@@ -1173,11 +1173,11 @@ static void video_enum_frame_sizes(struct
> device *dev, __u32 pixelformat)
> + 			video_enum_frame_intervals(dev,
> frame.pixel_format,
> + 				frame.stepwise.max_width,
> + 				frame.stepwise.max_height);
> +-			printf(")\n");
> ++			fprintf(stderr, ")\n");
> + 			break;
> +
> + 		case V4L2_FRMSIZE_TYPE_STEPWISE:
> +-			printf("\tFrame size: %ux%u - %ux%u (by %ux%u) (\n",
> ++			fprintf(stderr, "\tFrame size: %ux%u - %ux%u (by
> %ux%u) (\n",
> + 				frame.stepwise.min_width,
> + 				frame.stepwise.min_height,
> + 				frame.stepwise.max_width,
> +@@ -1187,7 +1187,7 @@ static void video_enum_frame_sizes(struct device
> *dev, __u32 pixelformat)
> + 			video_enum_frame_intervals(dev,
> frame.pixel_format,
> + 				frame.stepwise.max_width,
> + 				frame.stepwise.max_height);
> +-			printf(")\n");
> ++			fprintf(stderr, ")\n");
> + 			break;
> +
> + 		default:
> +@@ -1211,19 +1211,19 @@ static void video_enum_formats(struct device
> *dev, enum v4l2_buf_type type)
> + 			break;
> +
> + 		if (i !=3D fmt.index)
> +-			printf("Warning: driver returned wrong format index "
> ++			fprintf(stderr, "Warning: driver returned wrong format
> index "
> + 				"%u.\n", fmt.index);
> + 		if (type !=3D fmt.type)
> +-			printf("Warning: driver returned wrong format type "
> ++			fprintf(stderr, "Warning: driver returned wrong format
> type "
> + 				"%u.\n", fmt.type);
> +
> +-		printf("\tFormat %u: %s (%08x)\n", i,
> ++		fprintf(stderr, "\tFormat %u: %s (%08x)\n", i,
> + 			v4l2_format_name(fmt.pixelformat), fmt.pixelformat);
> +-		printf("\tType: %s (%u)\n", v4l2_buf_type_name(fmt.type),
> ++		fprintf(stderr, "\tType: %s (%u)\n",
> v4l2_buf_type_name(fmt.type),
> + 			fmt.type);
> +-		printf("\tName: %.32s\n", fmt.description);
> ++		fprintf(stderr, "\tName: %.32s\n", fmt.description);
> + 		video_enum_frame_sizes(dev, fmt.pixelformat);
> +-		printf("\n");
> ++		fprintf(stderr, "\n");
> + 	}
> + }
> +
> +@@ -1241,13 +1241,13 @@ static void video_enum_inputs(struct device
> *dev)
> + 			break;
> +
> + 		if (i !=3D input.index)
> +-			printf("Warning: driver returned wrong input index "
> ++			fprintf(stderr, "Warning: driver returned wrong input
> index "
> + 				"%u.\n", input.index);
> +
> +-		printf("\tInput %u: %s.\n", i, input.name);
> ++		fprintf(stderr, "\tInput %u: %s.\n", i, input.name);
> + 	}
> +
> +-	printf("\n");
> ++	fprintf(stderr, "\n");
> + }
> +
> + static int video_get_input(struct device *dev) @@ -1257,7 +1257,7 @@
> +static int video_get_input(struct device *dev)
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_G_INPUT, &input);
> + 	if (ret < 0) {
> +-		printf("Unable to get current input: %s (%d).\n",
> ++		fprintf(stderr, "Unable to get current input: %s (%d).\n",
> + 			strerror(errno), errno);
> + 		return ret;
> + 	}
> +@@ -1272,7 +1272,7 @@ static int video_set_input(struct device *dev,
> +unsigned int input)
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_S_INPUT, &_input);
> + 	if (ret < 0)
> +-		printf("Unable to select input %u: %s (%d).\n", input,
> ++		fprintf(stderr, "Unable to select input %u: %s (%d).\n", input,
> + 			strerror(errno), errno);
> +
> + 	return ret;
> +@@ -1291,14 +1291,14 @@ static int video_set_quality(struct device
> +*dev, unsigned int quality)
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_S_JPEGCOMP, &jpeg);
> + 	if (ret < 0) {
> +-		printf("Unable to set quality to %u: %s (%d).\n", quality,
> ++		fprintf(stderr, "Unable to set quality to %u: %s (%d).\n",
> quality,
> + 			strerror(errno), errno);
> + 		return ret;
> + 	}
> +
> + 	ret =3D ioctl(dev->fd, VIDIOC_G_JPEGCOMP, &jpeg);
> + 	if (ret >=3D 0)
> +-		printf("Quality set to %u\n", jpeg.quality);
> ++		fprintf(stderr, "Quality set to %u\n", jpeg.quality);
> +
> + 	return 0;
> + }
> +@@ -1313,7 +1313,7 @@ static int video_load_test_pattern(struct device
> *dev, const char *filename)
> + 	if (filename !=3D NULL) {
> + 		fd =3D open(filename, O_RDONLY);
> + 		if (fd =3D=3D -1) {
> +-			printf("Unable to open test pattern file '%s': %s
> (%d).\n",
> ++			fprintf(stderr, "Unable to open test pattern file '%s':
> %s
> ++(%d).\n",
> + 				filename, strerror(errno), errno);
> + 			return -errno;
> + 		}
> +@@ -1331,7 +1331,7 @@ static int video_load_test_pattern(struct device
> *dev, const char *filename)
> + 		if (filename !=3D NULL) {
> + 			ret =3D read(fd, dev->pattern[plane], size);
> + 			if (ret !=3D (int)size && dev-
> >plane_fmt[plane].bytesperline !=3D 0) {
> +-				printf("Test pattern file size %u doesn't match
> image size %u\n",
> ++				fprintf(stderr, "Test pattern file size %u
> doesn't match image
> ++size %u\n",
> + 					ret, size);
> + 				ret =3D -EINVAL;
> + 				goto done;
> +@@ -1341,7 +1341,7 @@ static int video_load_test_pattern(struct device
> *dev, const char *filename)
> + 			unsigned int i;
> +
> + 			if (dev->plane_fmt[plane].bytesperline =3D=3D 0) {
> +-				printf("Compressed format detected for plane
> %u and no test pattern filename given.\n"
> ++				fprintf(stderr, "Compressed format detected
> for plane %u and no test pattern filename given.\n"
> + 					"The test pattern can't be generated
> automatically.\n", plane);
> + 				ret =3D -EINVAL;
> + 				goto done;
> +@@ -1410,7 +1410,7 @@ static void video_verify_buffer(struct device
> +*dev, struct v4l2_buffer *buf)
> +
> + 		if (dev->plane_fmt[plane].sizeimage &&
> + 		    dev->plane_fmt[plane].sizeimage !=3D length)
> +-			printf("Warning: bytes used %u !=3D image size %u for
> plane %u\n",
> ++			fprintf(stderr, "Warning: bytes used %u !=3D image size
> %u for plane
> ++%u\n",
> + 			       length, dev->plane_fmt[plane].sizeimage, plane);
> +
> + 		if (buffer->padding[plane] =3D=3D 0)
> +@@ -1424,16 +1424,16 @@ static void video_verify_buffer(struct device
> *dev, struct v4l2_buffer *buf)
> + 		}
> +
> + 		if (errors) {
> +-			printf("Warning: %u bytes overwritten among %u first
> padding bytes for plane %u\n",
> ++			fprintf(stderr, "Warning: %u bytes overwritten among
> %u first
> ++padding bytes for plane %u\n",
> + 			       errors, dirty, plane);
> +
> + 			dirty =3D (dirty + 15) & ~15;
> + 			dirty =3D dirty > 32 ? 32 : dirty;
> +
> + 			for (i =3D 0; i < dirty; ++i) {
> +-				printf("%02x ", data[i]);
> ++				fprintf(stderr, "%02x ", data[i]);
> + 				if (i % 16 =3D=3D 15)
> +-					printf("\n");
> ++					fprintf(stderr, "\n");
> + 			}
> + 		}
> + 	}
> +@@ -1481,18 +1481,32 @@ static void video_save_image(struct device
> +*dev, struct v4l2_buffer *buf,
> +
> + 		ret =3D write(fd, dev->buffers[buf->index].mem[i], length);
> + 		if (ret < 0) {
> +-			printf("write error: %s (%d)\n", strerror(errno), errno);
> ++			fprintf(stderr, "write error: %s (%d)\n", strerror(errno),
> errno);
> + 			break;
> + 		} else if (ret !=3D (int)length)
> +-			printf("write error: only %d bytes written instead of
> %u\n",
> ++			fprintf(stderr, "write error: only %d bytes written
> instead of
> ++%u\n",
> + 			       ret, length);
> + 	}
> + 	close(fd);
> + }
> +
> ++static void video_stdout_image(struct device *dev, struct v4l2_buffer
> ++*buf) {
> ++    int ret;
> ++
> ++    fprintf(stderr, "stdout");
> ++    ret =3D fwrite(dev->buffers[buf->index].mem, buf->bytesused, 1,
> ++ stdout);
> ++
> ++    if (ret < 0)
> ++        fprintf(stderr, "write error: %s (%d)\n", strerror(errno), errn=
o);
> ++    else if (ret !=3D (int)buf->bytesused)
> ++        fprintf(stderr, "write error: only %d bytes written instead of =
%u\n",
> ++                ret, buf->bytesused);
> ++}
> ++
> + static int video_do_capture(struct device *dev, unsigned int nframes,
> + 	unsigned int skip, unsigned int delay, const char *pattern,
> +-	int do_requeue_last, enum buffer_fill_mode fill)
> ++	int do_requeue_last, enum buffer_fill_mode fill, int do_stdout)
> + {
> + 	struct v4l2_plane planes[VIDEO_MAX_PLANES];
> + 	struct v4l2_buffer buf;
> +@@ -1529,7 +1543,7 @@ static int video_do_capture(struct device *dev,
> unsigned int nframes,
> + 		ret =3D ioctl(dev->fd, VIDIOC_DQBUF, &buf);
> + 		if (ret < 0) {
> + 			if (errno !=3D EIO) {
> +-				printf("Unable to dequeue buffer: %s
> (%d).\n",
> ++				fprintf(stderr, "Unable to dequeue buffer: %s
> (%d).\n",
> + 					strerror(errno), errno);
> + 				goto done;
> + 			}
> +@@ -1550,7 +1564,7 @@ static int video_do_capture(struct device *dev,
> +unsigned int nframes,
> +
> + 		clock_gettime(CLOCK_MONOTONIC, &ts);
> + 		get_ts_flags(buf.flags, &ts_type, &ts_source);
> +-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps
> ts %s/%s\n", i, buf.index,
> ++		fprintf(stderr, "%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld
> %.3f
> ++fps ts %s/%s\n", i, buf.index,
> + 			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
> + 			v4l2_field_name(buf.field),
> + 			buf.sequence, buf.bytesused, buf.timestamp.tv_sec,
> @@ -1563,6
> ++1577,9 @@ static int video_do_capture(struct device *dev, unsigned int
> nframes,
> + 		if (video_is_capture(dev) && pattern && !skip)
> + 			video_save_image(dev, &buf, pattern, i);
> +
> ++		if (video_is_capture(dev) && do_stdout && !skip)
> ++			video_stdout_image(dev, &buf);
> ++
> + 		if (skip)
> + 			--skip;
> +
> +@@ -1577,7 +1594,7 @@ static int video_do_capture(struct device *dev,
> +unsigned int nframes,
> +
> + 		ret =3D video_queue_buffer(dev, buf.index, fill);
> + 		if (ret < 0) {
> +-			printf("Unable to requeue buffer: %s (%d).\n",
> ++			fprintf(stderr, "Unable to requeue buffer: %s (%d).\n",
> + 				strerror(errno), errno);
> + 			goto done;
> + 		}
> +@@ -1587,7 +1604,7 @@ static int video_do_capture(struct device *dev,
> unsigned int nframes,
> + 	video_enable(dev, 0);
> +
> + 	if (nframes =3D=3D 0) {
> +-		printf("No frames captured.\n");
> ++		fprintf(stderr, "No frames captured.\n");
> + 		goto done;
> + 	}
> +
> +@@ -1604,7 +1621,7 @@ static int video_do_capture(struct device *dev,
> unsigned int nframes,
> + 	bps =3D size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
> + 	fps =3D i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
> +
> +-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
> ++	fprintf(stderr, "Captured %u frames in %lu.%06lu seconds (%f fps, %f
> ++B/s).\n",
> + 		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
> +
> + done:
> +@@ -1616,42 +1633,42 @@ done:
> +
> + static void usage(const char *argv0)
> + {
> +-	printf("Usage: %s [options] device\n", argv0);
> +-	printf("Supported options:\n");
> +-	printf("-B, --buffer-type		Buffer type (\"capture\",
> \"output\",\n");
> +-	printf("                                \"capture-mplane\" or \"output=
-
> mplane\")\n");
> +-	printf("-c, --capture[=3Dnframes]		Capture frames\n");
> +-	printf("-C, --check-overrun		Verify dequeued frames for
> buffer overrun\n");
> +-	printf("-d, --delay			Delay (in ms) before
> requeuing buffers\n");
> +-	printf("-f, --format format		Set the video format\n");
> +-	printf("-F, --file[=3Dname]		Read/write frames from/to disk\n");
> +-	printf("\tFor video capture devices, the first '#' character in the fi=
le
> name is\n");
> +-	printf("\texpanded to the frame sequence number. The default file
> name is\n");
> +-	printf("\t'frame-#.bin'.\n");
> +-	printf("-h, --help			Show this help screen\n");
> +-	printf("-i, --input input		Select the video input\n");
> +-	printf("-I, --fill-frames		Fill frames with check pattern before
> queuing them\n");
> +-	printf("-l, --list-controls		List available controls\n");
> +-	printf("-n, --nbufs n			Set the number of video
> buffers\n");
> +-	printf("-p, --pause			Pause before starting the
> video stream\n");
> +-	printf("-q, --quality n			MJPEG quality (0-100)\n");
> +-	printf("-r, --get-control ctrl		Get control 'ctrl'\n");
> +-	printf("-R, --realtime=3D[priority]	Enable realtime RR scheduling\n");
> +-	printf("-s, --size WxH			Set the frame size\n");
> +-	printf("-t, --time-per-frame num/denom	Set the time per frame (eg.
> 1/25 =3D 25 fps)\n");
> +-	printf("-u, --userptr			Use the user pointers
> streaming method\n");
> +-	printf("-w, --set-control 'ctrl value'	Set control 'ctrl' to 'value'\n=
");
> +-	printf("    --enum-formats		Enumerate formats\n");
> +-	printf("    --enum-inputs		Enumerate inputs\n");
> +-	printf("    --fd                        Use a numeric file descriptor =
insted of a
> device\n");
> +-	printf("    --field			Interlaced format field order\n");
> +-	printf("    --no-query			Don't query capabilities on
> open\n");
> +-	printf("    --offset			User pointer buffer offset
> from page start\n");
> +-	printf("    --requeue-last		Requeue the last buffers before
> streamoff\n");
> +-	printf("    --timestamp-source		Set timestamp source on
> output buffers [eof, soe]\n");
> +-	printf("    --skip n			Skip the first n frames\n");
> +-	printf("    --sleep-forever		Sleep forever after configuring
> the device\n");
> +-	printf("    --stride value		Line stride in bytes\n");
> ++	fprintf(stderr, "Usage: %s [options] device\n", argv0);
> ++	fprintf(stderr, "Supported options:\n");
> ++	fprintf(stderr, "-B, --buffer-type		Buffer type (\"capture\",
> \"output\",\n");
> ++	fprintf(stderr, "                                \"capture-mplane\" or=
 \"output-
> mplane\")\n");
> ++	fprintf(stderr, "-c, --capture[=3Dnframes]		Capture frames\n");
> ++	fprintf(stderr, "-C, --check-overrun		Verify dequeued
> frames for buffer overrun\n");
> ++	fprintf(stderr, "-d, --delay			Delay (in ms) before
> requeuing buffers\n");
> ++	fprintf(stderr, "-f, --format format		Set the video
> format\n");
> ++	fprintf(stderr, "-F, --file[=3Dname]		Read/write frames from/to
> disk\n");
> ++	fprintf(stderr, "\tFor video capture devices, the first '#' character =
in
> the file name is\n");
> ++	fprintf(stderr, "\texpanded to the frame sequence number. The
> default file name is\n");
> ++	fprintf(stderr, "\t'frame-#.bin'.\n");
> ++	fprintf(stderr, "-h, --help			Show this help
> screen\n");
> ++	fprintf(stderr, "-i, --input input		Select the video input\n");
> ++	fprintf(stderr, "-I, --fill-frames		Fill frames with check pattern
> before queuing them\n");
> ++	fprintf(stderr, "-l, --list-controls		List available controls\n");
> ++	fprintf(stderr, "-n, --nbufs n			Set the number of
> video buffers\n");
> ++	fprintf(stderr, "-p, --pause			Pause before starting
> the video stream\n");
> ++	fprintf(stderr, "-q, --quality n			MJPEG quality (0-
> 100)\n");
> ++	fprintf(stderr, "-r, --get-control ctrl		Get control 'ctrl'\n");
> ++	fprintf(stderr, "-R, --realtime=3D[priority]	Enable realtime RR
> scheduling\n");
> ++	fprintf(stderr, "-s, --size WxH			Set the frame size\n");
> ++	fprintf(stderr, "-t, --time-per-frame num/denom	Set the time per
> frame (eg. 1/25 =3D 25 fps)\n");
> ++	fprintf(stderr, "-u, --userptr			Use the user pointers
> streaming method\n");
> ++	fprintf(stderr, "-w, --set-control 'ctrl value'	Set control 'ctrl' to
> 'value'\n");
> ++	fprintf(stderr, "    --enum-formats		Enumerate
> formats\n");
> ++	fprintf(stderr, "    --enum-inputs		Enumerate inputs\n");
> ++	fprintf(stderr, "    --fd                        Use a numeric file de=
scriptor
> insted of a device\n");
> ++	fprintf(stderr, "    --field			Interlaced format field
> order\n");
> ++	fprintf(stderr, "    --no-query			Don't query
> capabilities on open\n");
> ++	fprintf(stderr, "    --offset			User pointer buffer
> offset from page start\n");
> ++	fprintf(stderr, "    --requeue-last		Requeue the last buffers
> before streamoff\n");
> ++	fprintf(stderr, "    --timestamp-source		Set timestamp source
> on output buffers [eof, soe]\n");
> ++	fprintf(stderr, "    --skip n			Skip the first n
> frames\n");
> ++	fprintf(stderr, "    --sleep-forever		Sleep forever after
> configuring the device\n");
> ++	fprintf(stderr, "    --stride value		Line stride in bytes\n");
> + }
> +
> + #define OPT_ENUM_FORMATS	256
> +@@ -1665,6 +1682,7 @@ static void usage(const char *argv0)
> + #define OPT_FD			264
> + #define OPT_TSTAMP_SRC		265
> + #define OPT_FIELD		266
> ++#define OPT_STDOUT		267
> +
> + static struct option opts[] =3D {
> + 	{"buffer-type", 1, 0, 'B'},
> +@@ -1677,6 +1695,7 @@ static struct option opts[] =3D {
> + 	{"field", 1, 0, OPT_FIELD},
> + 	{"file", 2, 0, 'F'},
> + 	{"fill-frames", 0, 0, 'I'},
> ++	{"stdout", 0, 0, OPT_STDOUT},
> + 	{"format", 1, 0, 'f'},
> + 	{"help", 0, 0, 'h'},
> + 	{"input", 1, 0, 'i'},
> +@@ -1717,7 +1736,8 @@ int main(int argc, char *argv[])
> + 	int do_list_controls =3D 0, do_get_control =3D 0, do_set_control =3D 0=
;
> + 	int do_sleep_forever =3D 0, do_requeue_last =3D 0;
> + 	int do_rt =3D 0;
> +-	int no_query =3D 0;
> ++	int no_query =3D 0;
> ++	int do_stdout =3D 0;
> + 	char *endptr;
> + 	int c;
> +
> +@@ -1755,7 +1775,7 @@ int main(int argc, char *argv[])
> + 		case 'B':
> + 			ret =3D v4l2_buf_type_from_string(optarg);
> + 			if (ret =3D=3D -1) {
> +-				printf("Bad buffer type \"%s\"\n", optarg);
> ++				fprintf(stderr, "Bad buffer type \"%s\"\n",
> optarg);
> + 				return 1;
> + 			}
> + 			video_set_buf_type(&dev, ret);
> +@@ -1775,7 +1795,7 @@ int main(int argc, char *argv[])
> + 			do_set_format =3D 1;
> + 			info =3D v4l2_format_by_name(optarg);
> + 			if (info =3D=3D NULL) {
> +-				printf("Unsupported video format '%s'\n",
> optarg);
> ++				fprintf(stderr, "Unsupported video format
> '%s'\n", optarg);
> + 				return 1;
> + 			}
> + 			pixelformat =3D info->fourcc;
> +@@ -1812,7 +1832,7 @@ int main(int argc, char *argv[])
> + 		case 'r':
> + 			ctrl_name =3D strtol(optarg, &endptr, 0);
> + 			if (*endptr !=3D 0) {
> +-				printf("Invalid control name '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid control name '%s'\n",
> optarg);
> + 				return 1;
> + 			}
> + 			do_get_control =3D 1;
> +@@ -1826,12 +1846,12 @@ int main(int argc, char *argv[])
> + 			do_set_format =3D 1;
> + 			width =3D strtol(optarg, &endptr, 10);
> + 			if (*endptr !=3D 'x' || endptr =3D=3D optarg) {
> +-				printf("Invalid size '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid size '%s'\n", optarg);
> + 				return 1;
> + 			}
> + 			height =3D strtol(endptr + 1, &endptr, 10);
> + 			if (*endptr !=3D 0) {
> +-				printf("Invalid size '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid size '%s'\n", optarg);
> + 				return 1;
> + 			}
> + 			break;
> +@@ -1839,12 +1859,12 @@ int main(int argc, char *argv[])
> + 			do_set_time_per_frame =3D 1;
> + 			time_per_frame.numerator =3D strtol(optarg, &endptr,
> 10);
> + 			if (*endptr !=3D '/' || endptr =3D=3D optarg) {
> +-				printf("Invalid time per frame '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid time per frame '%s'\n",
> optarg);
> + 				return 1;
> + 			}
> + 			time_per_frame.denominator =3D strtol(endptr + 1,
> &endptr, 10);
> + 			if (*endptr !=3D 0) {
> +-				printf("Invalid time per frame '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid time per frame '%s'\n",
> optarg);
> + 				return 1;
> + 			}
> + 			break;
> +@@ -1854,12 +1874,12 @@ int main(int argc, char *argv[])
> + 		case 'w':
> + 			ctrl_name =3D strtol(optarg, &endptr, 0);
> + 			if (*endptr !=3D ' ' || endptr =3D=3D optarg) {
> +-				printf("Invalid control name '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid control name '%s'\n",
> optarg);
> + 				return 1;
> + 			}
> + 			ctrl_value =3D strtol(endptr + 1, &endptr, 0);
> + 			if (*endptr !=3D 0) {
> +-				printf("Invalid control value '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid control value '%s'\n",
> optarg);
> + 				return 1;
> + 			}
> + 			do_set_control =3D 1;
> +@@ -1873,16 +1893,16 @@ int main(int argc, char *argv[])
> + 		case OPT_FD:
> + 			ret =3D atoi(optarg);
> + 			if (ret < 0) {
> +-				printf("Bad file descriptor %d\n", ret);
> ++				fprintf(stderr, "Bad file descriptor %d\n", ret);
> + 				return 1;
> + 			}
> +-			printf("Using file descriptor %d\n", ret);
> ++			fprintf(stderr, "Using file descriptor %d\n", ret);
> + 			video_set_fd(&dev, ret);
> + 			break;
> + 		case OPT_FIELD:
> + 			field =3D v4l2_field_from_string(optarg);
> + 			if (field =3D=3D (enum v4l2_field)-1) {
> +-				printf("Invalid field order '%s'\n", optarg);
> ++				fprintf(stderr, "Invalid field order '%s'\n",
> optarg);
> + 				return 1;
> + 			}
> + 			break;
> +@@ -1907,22 +1927,25 @@ int main(int argc, char *argv[])
> + 			} else if (!strcmp(optarg, "soe")) {
> + 				dev.buffer_output_flags |=3D
> V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
> + 			} else {
> +-				printf("Invalid timestamp source %s\n",
> optarg);
> ++				fprintf(stderr, "Invalid timestamp source
> %s\n", optarg);
> + 				return 1;
> + 			}
> + 			break;
> + 		case OPT_USERPTR_OFFSET:
> + 			userptr_offset =3D atoi(optarg);
> + 			break;
> ++		case OPT_STDOUT:
> ++			do_stdout =3D 1;
> ++			break;
> + 		default:
> +-			printf("Invalid option -%c\n", c);
> +-			printf("Run %s -h for help.\n", argv[0]);
> ++			fprintf(stderr, "Invalid option -%c\n", c);
> ++			fprintf(stderr, "Run %s -h for help.\n", argv[0]);
> + 			return 1;
> + 		}
> + 	}
> +
> + 	if ((fill_mode & BUFFER_FILL_PADDING) && memtype !=3D
> V4L2_MEMORY_USERPTR) {
> +-		printf("Buffer overrun can only be checked in USERPTR
> mode.\n");
> ++		fprintf(stderr, "Buffer overrun can only be checked in USERPTR
> ++mode.\n");
> + 		return 1;
> + 	}
> +
> +@@ -1959,7 +1982,7 @@ int main(int argc, char *argv[])
> + 		ret =3D get_control(&dev, ctrl_name,
> + 				  get_control_type(&dev, ctrl_name), &val);
> + 		if (ret >=3D 0)
> +-			printf("Control 0x%08x value %" PRId64 "\n",
> ctrl_name, val);
> ++			fprintf(stderr, "Control 0x%08x value %" PRId64 "\n",
> ctrl_name,
> ++val);
> + 	}
> +
> + 	if (do_set_control)
> +@@ -1970,7 +1993,7 @@ int main(int argc, char *argv[])
> + 		video_list_controls(&dev);
> +
> + 	if (do_enum_formats) {
> +-		printf("- Available formats:\n");
> ++		fprintf(stderr, "- Available formats:\n");
> + 		video_enum_formats(&dev,
> V4L2_BUF_TYPE_VIDEO_CAPTURE);
> + 		video_enum_formats(&dev,
> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> + 		video_enum_formats(&dev, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> @@ -1979,14
> ++2002,14 @@ int main(int argc, char *argv[])
> + 	}
> +
> + 	if (do_enum_inputs) {
> +-		printf("- Available inputs:\n");
> ++		fprintf(stderr, "- Available inputs:\n");
> + 		video_enum_inputs(&dev);
> + 	}
> +
> + 	if (do_set_input) {
> + 		video_set_input(&dev, input);
> + 		ret =3D video_get_input(&dev);
> +-		printf("Input %d selected\n", ret);
> ++		fprintf(stderr, "Input %d selected\n", ret);
> + 	}
> +
> + 	/* Set the video format. */
> +@@ -2028,7 +2051,7 @@ int main(int argc, char *argv[])
> + 	}
> +
> + 	if (do_pause) {
> +-		printf("Press enter to start capture\n");
> ++		fprintf(stderr, "Press enter to start capture\n");
> + 		getchar();
> + 	}
> +
> +@@ -2037,12 +2060,12 @@ int main(int argc, char *argv[])
> + 		sched.sched_priority =3D rt_priority;
> + 		ret =3D sched_setscheduler(0, SCHED_RR, &sched);
> + 		if (ret < 0)
> +-			printf("Failed to select RR scheduler: %s (%d)\n",
> ++			fprintf(stderr, "Failed to select RR scheduler: %s
> (%d)\n",
> + 				strerror(errno), errno);
> + 	}
> +
> + 	if (video_do_capture(&dev, nframes, skip, delay, filename,
> +-			     do_requeue_last, fill_mode) < 0) {
> ++			     do_requeue_last, fill_mode, do_stdout) < 0) {
> + 		video_close(&dev);
> + 		return 1;
> + 	}
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-
> multimedia/v4l2apps/yavta_git.bbappend b/meta-arago-extras/recipes-
> multimedia/v4l2apps/yavta_git.bbappend
> new file mode 100644
> index 0000000..75721b8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/v4l2apps/yavta_git.bbappend
> @@ -0,0 +1,12 @@
> +# This change has been accepted upstream and will be available in the
> +next # stable 1.7 release of the Yocto Project after Daisy (version 1.6)=
.
> +# The updated version of the patch in the yavta directory can also be #
> +removed at that point.
> +
> +SRCREV =3D "7e9f28bedc1ed3205fb5164f686aea96f27a0de2"
> +
> +PR_append =3D "-arago1"
[Franklin] This should be 0.
> +
> +CFLAGS +=3D "-I${S}/include"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

