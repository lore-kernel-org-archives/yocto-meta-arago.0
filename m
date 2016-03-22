Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 389CC529EA
	for <meta-arago@arago-project.org>;
	Tue, 22 Mar 2016 22:25:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2MMP3jx014713
	for <meta-arago@arago-project.org>; Tue, 22 Mar 2016 17:25:03 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MMP2JD012634
	for <meta-arago@arago-project.org>; Tue, 22 Mar 2016 17:25:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 22 Mar 2016 17:25:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MMP24D019276;
	Tue, 22 Mar 2016 17:25:02 -0500
Date: Tue, 22 Mar 2016 18:24:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20160322222446.GV3298@edge>
References: <1458677814-45157-1-git-send-email-e-ruei1@ti.com>
	<20160322202227.GO3298@edge> <20160322220908.GU3298@edge>
	<009C030982313E4589C6BC55FBF1E82A1424C47D@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <009C030982313E4589C6BC55FBF1E82A1424C47D@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] dual-camera-demo: Enhance to support both AM4 and AM5
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
X-List-Received-Date: Tue, 22 Mar 2016 22:25:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The first should be fine, no need to resend.

On Tue, Mar 22, 2016 at 06:20:54PM -0400, Ruei, Eric wrote:
> 
> Hi, Denys:
> 
> Can you take the first patch? Or should I send the third one?
> 
> Best regards,
> 
> Eric
>  
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, March 22, 2016 6:09 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] dual-camera-demo: Enhance to support both AM4 and AM5
> 
> On Tue, Mar 22, 2016 at 04:22:27PM -0400, Denys Dmytriyenko wrote:
> > On Tue, Mar 22, 2016 at 04:16:54PM -0400, Eric Ruei wrote:
> > > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > > ---
> > >  ...mera-demo-Enhance-to-support-both-AM4-AM5.patch | 469 +++++++++++++++++++++
> > >  .../dual-camera-demo/dual_camera_qt5.sh            |   2 +-
> > >  .../dual-camera-demo/dual_camera_qt5_omap-a15.sh   |  13 +
> > >  .../dual-camera-demo/dual-camera-demo_1.0.bb       |   5 +-
> > >  4 files changed, 487 insertions(+), 2 deletions(-)  create mode 
> > > 100644 
> > > meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > > mo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch
> > >  create mode 100644 
> > > meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > > mo/dual_camera_qt5_omap-a15.sh
> > > 
> > > diff --git 
> > > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch 
> > > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch
> > > new file mode 100644
> > > index 0000000..347438d
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > > +++ era-demo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.p
> > > +++ atch
> > > @@ -0,0 +1,469 @@
> > > +From 86ed5c9c3f9b8e71cd9980f847623af0caf4c187 Mon Sep 17 00:00:00 
> > > +2001
> > > +From: Eric Ruei <e-ruei1@ti.com>
> > > +Date: Mon, 21 Mar 2016 16:27:58 -0400
> > > +Subject: [PATCH] dual camera demo: Enhance to support both AM4/AM5
> > > +
> > > +- Initialize and restore DRM plane zorders
> > > +- Add input parameter trans_key_mode (AM4:1;AM5:2)
> > > +- Cleanup the exit sequence to avoid unnecessary operations and 
> > > +warnings
> > > +
> > > +
> > > +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > > +---
> > > + loopback.c | 227 +++++++++++++++++++++++++++++++++++++++++++++++++++++--------
> > > + loopback.h |   1 +
> > > + main.cpp   |  36 ++++++++--
> > > + 3 files changed, 228 insertions(+), 36 deletions(-)
> > > +
> > > +diff --git a/loopback.c b/loopback.c index dda0390..66052b3 100644
> > > +--- a/loopback.c
> > > ++++ b/loopback.c
> > > +@@ -34,7 +34,9 @@
> > > + #define FOURCC_STR(str)    FOURCC(str[0], str[1], str[2], str[3])
> > > + 
> > > + #define PAGE_SHIFT 12
> > > +-#define NBUF (3)
> > > ++#define NBUF (3)
> > > ++#define MAX_DRM_PLANES 5
> > > ++
> > > + 
> > > + struct control status;
> > > + 
> > > +@@ -64,14 +66,22 @@ struct drm_device_info  {
> > > + 	int fd;
> > > + 	int width;
> > > +-	int height;
> > > ++	int height;
> > > ++	unsigned int num_planes;
> > > + 	char dev_name[9];
> > > + 	char name[4];
> > > + 	unsigned int bo_flags;
> > > + 	struct dmabuf_buffer **buf[2];
> > > + 	struct omap_device *dev;
> > > + 	unsigned int crtc_id;
> > > +-	unsigned plane_id[2];
> > > ++	unsigned int plane_id[2];
> > > ++	unsigned int prop_id_trans_key_mode;
> > > ++	unsigned int prop_id_alpha_blender;
> > > ++	unsigned int prop_id_zorder;
> > > ++	uint64_t prop_value_trans_key_mode;
> > > ++	uint64_t prop_value_alpha_blender;
> > > ++	uint32_t prop_value_zorder[MAX_DRM_PLANES];
> > > ++	uint32_t drm_plane_id[MAX_DRM_PLANES];
> > > + 	bool multiplanar;	/* True when Y and U/V are in separate buffers. */
> > > + } drm_device;
> > > + 
> > > +@@ -500,6 +510,121 @@ struct dmabuf_buffer *v4l2_dequeue_buffer(struct v4l2_device_info *device)
> > > + 	}
> > > + 
> > > + 	return buf;
> > > ++}
> > > ++
> > > ++/*
> > > ++ * Reorder the zorder of DRM planes to the desired order for demo
> > > ++ *      VID1: 1
> > > ++ *      VID2: 2
> > > ++ *      CRTC: 3
> > > ++ */
> > > ++
> > > ++int drm_init_plane_zorder(struct drm_device_info *device) {
> > > ++	int i,j;
> > > ++	drmModePlaneRes *res;
> > > ++	drmModePlane *plane;
> > > ++	drmModeObjectProperties *props;
> > > ++	drmModePropertyRes *props_info;
> > > ++	uint32_t zorder=1;
> > > ++	int ret = 0;
> > > ++
> > > ++	// This will explain the planes to include CRTC, but setPlane is not applicable to 
> > > ++	// the CRTC plane
> > > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> > > ++
> > > ++	res = drmModeGetPlaneResources(device->fd);
> > > ++
> > > ++	if(res == NULL){
> > > ++		ERROR("plane resources not found\n");
> > > ++		ret = -1;
> > > ++		goto drm_init_plane_zorder_error;
> > > ++	}
> > > ++
> > > ++	//DBG("drm_init_plane_zorder:no. of planes = %d\n", 
> > > ++res->count_planes);
> > > ++
> > > ++	if (res->count_planes > MAX_DRM_PLANES)
> > > ++	{
> > > ++
> > > ++		ERROR("There are two many DRM planes (%d > %d)\n", res->count_planes, MAX_DRM_PLANES);
> > > ++		ret = -1;
> > > ++		goto drm_init_plane_zorder_error;
> > > ++	}
> > > ++
> > > ++	device->num_planes = res->count_planes;
> > > ++	for (i = 0; i < res->count_planes; i++) {
> > > ++		uint32_t plane_id = res->planes[i];
> > > ++		bool fCRTC = 0;
> > > ++		uint32_t zorder_value = 3;
> > > ++
> > > ++		drmModePlane *plane = drmModeGetPlane(device->fd, plane_id);
> > > ++		if(plane == NULL){
> > > ++			ERROR("plane (%d) not found\n", plane_id);
> > > ++			continue;
> > > ++		}
> > > ++
> > > ++		// TBD: check for required plane attributes
> > > ++		device->drm_plane_id[i] = plane->plane_id;
> > > ++
> > > ++		props = drmModeObjectGetProperties(device->fd, plane->plane_id, 
> > > ++DRM_MODE_OBJECT_PLANE);
> > > ++
> > > ++		if(props == NULL){
> > > ++			ERROR("plane (%d) properties not found\n",  plane->plane_id);
> > > ++			continue;
> > > ++		}
> > > ++
> > > ++		for (j = 0; j < props->count_props; j++)
> > > ++		{
> > > ++			props_info = drmModeGetProperty(device->fd, props->props[j]);
> > > ++
> > > ++			if(props_info == NULL){
> > > ++				ERROR("plane(%d) props[%d] not found\n", plane->plane_id, j);
> > > ++				continue;
> > > ++			}
> > > ++
> > > ++			if (strcmp("type", props_info->name) == 0)
> > > ++			{
> > > ++				fCRTC = (props->prop_values[j] == 1)?1:0;
> > > ++			}
> > > ++			else if ((strcmp("zorder", props_info->name) == 0))
> > > ++			{
> > > ++				if (!device->prop_id_zorder)
> > > ++				{
> > > ++					device->prop_id_zorder = props_info->prop_id;
> > > ++				}
> > > ++				device->prop_value_zorder[i] = (uint32_t)props->prop_values[j];
> > > ++			}
> > > ++
> > > ++			drmModeFreeProperty(props_info);
> > > ++		}
> > > ++
> > > ++		/* Re-arrange zorder */
> > > ++		if (!fCRTC)
> > > ++		{
> > > ++			zorder_value = zorder++;
> > > ++		}
> > > ++
> > > ++		j = drmModeObjectSetProperty(device->fd, plane->plane_id,
> > > ++									 DRM_MODE_OBJECT_PLANE, device->prop_id_zorder,
> > > ++									(uint64_t)zorder_value);
> > > ++
> > > ++		if (j < 0) {
> > > ++			ERROR("set z-order for plane id %d failed\n", plane->plane_id);
> > > ++		}
> > > ++
> > > ++		drmModeFreeObjectProperties(props);
> > > ++		drmModeFreePlane(plane);
> > > ++
> > > ++	}
> > > ++
> > > ++	drmModeFreePlaneResources(res);
> > > ++
> > > ++drm_init_plane_zorder_error:
> > > ++
> > > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> > > ++
> > > ++	return(ret);
> > > ++
> > > + }
> > > + 
> > > + uint32_t drm_reserve_plane(int fd) @@ -508,7 +633,7 @@ uint32_t 
> > > +drm_reserve_plane(int fd)
> > > + 	drmModePlaneRes *res = drmModeGetPlaneResources(fd);
> > > + 	if(res == NULL){
> > > + 		ERROR("plane resources not found\n");
> > > +-	}
> > > ++	}
> > > + 
> > > + 	for (i = 0; i < res->count_planes; i++) {
> > > + 		uint32_t plane_id = res->planes[i]; @@ -520,7 +645,7 @@ uint32_t 
> > > +drm_reserve_plane(int fd)
> > > + 			continue;
> > > + 
> > > + 		drmModePlane *plane = drmModeGetPlane(fd, plane_id);
> > > +-		if(res == NULL){
> > > ++		if(plane == NULL){
> > > + 			ERROR("plane  not found\n");
> > > + 		}
> > > + 
> > > +@@ -577,9 +702,45 @@ void drm_crtc_resolution(struct drm_device_info *device)
> > > + 		device->height = crtc->height;
> > > + 
> > > + 		drmModeFreeCrtc(crtc);
> > > +-		drmModeFreeResources(res);
> > > ++	}
> > > ++
> > > ++	drmModeFreeResources(res);
> > > ++
> > > ++}
> > > ++
> > > ++/*
> > > ++ * DRM restore properties
> > > ++ */
> > > ++static void drm_restore_props(struct drm_device_info *device) {
> > > ++	unsigned int i;
> > > ++
> > > ++	/* restore the original zorder of DRM planes */
> > > ++
> > > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> > > ++
> > > ++	for (i = 0; i < device->num_planes; i++) {
> > > ++		if (device->drm_plane_id[i])
> > > ++		{
> > > ++			drmModeObjectSetProperty(device->fd, device->drm_plane_id[i],
> > > ++									 DRM_MODE_OBJECT_PLANE, device->prop_id_zorder,
> > > ++									 (uint64_t)device->prop_value_zorder[i]);
> > > ++		}
> > > + 	}
> > > +-}
> > > ++
> > > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> > > ++
> > > ++	if(device->prop_id_trans_key_mode){
> > > ++		drmModeObjectSetProperty(device->fd,  device->crtc_id,
> > > ++			DRM_MODE_OBJECT_CRTC, device->prop_id_trans_key_mode, device->prop_value_trans_key_mode);
> > > ++	}
> > > ++
> > > ++	if(device->prop_id_alpha_blender){
> > > ++		drmModeObjectSetProperty(device->fd,  device->crtc_id,
> > > ++			DRM_MODE_OBJECT_CRTC, device->prop_id_alpha_blender, device->prop_value_alpha_blender);
> > > ++	}
> > > ++}
> > > ++
> > > + /*
> > > + * drm device init
> > > + */
> > > +@@ -587,12 +748,14 @@ static int drm_init_device(struct 
> > > +drm_device_info *device)  {
> > > + 	unsigned char j;
> > > + 
> > > +-	if (!device->fd) {
> > > ++	if (!device->fd) {
> > > + 		device->fd = drmOpen("omapdrm", NULL);
> > > + 		if (device->fd < 0) {
> > > + 			ERROR("could not open drm device: %s (%d)", strerror(errno), errno);
> > > + 			return -1;
> > > +-		}
> > > ++		}
> > > ++		if (drm_init_plane_zorder(device))
> > > ++			return -1;
> > > + 	}
> > > + 
> > > + 	device->dev = omap_device_new(device->fd); @@ -600,16 +763,15 @@ 
> > > +static int drm_init_device(struct drm_device_info *device)
> > > + 	/* Get CRTC id and resolution. As well set the global display width and height */
> > > + 	drm_crtc_resolution(device);
> > > + 
> > > +-
> > > + 	/* Store display resolution so GUI can be configured */
> > > + 	status.display_xres = device->width;
> > > +-	status.display_yres = device->height;
> > > ++	status.display_yres = device->height;
> > > + 
> > > + 	/* AM437x has two video planes and one graphics plane.  */
> > > + 	/* Get one video plane  for each camera                 */
> > > + 	for (j = 0; j < status.num_cams; j++) {
> > > + 
> > > +-		device->plane_id[j] = drm_reserve_plane(device->fd);
> > > ++		device->plane_id[j] = drm_reserve_plane(device->fd);
> > > + 	}
> > > + 
> > > + 	return 0;
> > > +@@ -619,7 +781,9 @@ static int drm_init_device(struct 
> > > +drm_device_info *device)  *Clean resources while exiting drm device  
> > > +*/  static void drm_exit_device(struct drm_device_info *device) -{
> > > ++{
> > > ++
> > > ++	drm_restore_props(device);
> > > + 	omap_device_del(device->dev);
> > > + 	device->dev = NULL;
> > > + 
> > > +@@ -637,8 +801,6 @@ static int drm_init_dss(void)  {
> > > + 	drmModeObjectProperties *props;
> > > + 	drmModePropertyRes *propRes;
> > > +-	unsigned int prop_trans_key_mode = 0;
> > > +-	unsigned int prop_alpha_blender = 0;
> > > + 	unsigned int j;
> > > + 
> > > + 	props = drmModeObjectGetProperties(drm_device.fd, 
> > > +drm_device.crtc_id, @@ -651,41 +813,43 @@ static int drm_init_dss(void)
> > > + 			continue;
> > > + 
> > > + 		if (strcmp(propRes->name, "trans-key-mode") == 0) {
> > > +-			prop_trans_key_mode = props->props[j];
> > > ++			drm_device.prop_id_trans_key_mode = props->props[j];
> > > ++			drm_device.prop_value_trans_key_mode = props->prop_values[j];
> > > + 		}
> > > + 
> > > + 		if (strcmp(propRes->name, "alpha_blender") == 0) {
> > > +-			prop_alpha_blender = props->props[j];
> > > ++			drm_device.prop_id_alpha_blender = props->props[j];
> > > ++			drm_device.prop_value_alpha_blender = props->prop_values[j];
> > > + 		}
> > > + 
> > > +-		if(prop_alpha_blender & prop_trans_key_mode){
> > > ++		if(drm_device.prop_id_trans_key_mode & 
> > > ++drm_device.prop_id_alpha_blender){
> > > + 			break;
> > > + 		}
> > > + 	}
> > > + 
> > > +-	if(prop_trans_key_mode == 0){
> > > +-		ERROR("TRANSPARENCY PROPERTY NOT FOUND\n");
> > > ++	if(drm_device.prop_id_trans_key_mode == 0){
> > > ++		ERROR("TRANSPARENCY PROPERTY NOT FOUND\n");
> > > + 		return -1;
> > > + 	}
> > > + 
> > > +-	if(prop_alpha_blender == 0){
> > > ++	if(drm_device.prop_id_alpha_blender == 0){
> > > + 		ERROR("ALPHA BLENDER PROPERTY NOT FOUND\n");
> > > + 		return -1;
> > > + 	}
> > > + 
> > > + 	/* Enable the transparency color key */
> > > + 	if (drmModeObjectSetProperty(drm_device.fd,  drm_device.crtc_id,
> > > +-		DRM_MODE_OBJECT_CRTC, prop_trans_key_mode, 1) < 0) {
> > > ++		DRM_MODE_OBJECT_CRTC, drm_device.prop_id_trans_key_mode, 
> > > ++status.trans_key_mode) < 0) {
> > > + 			ERROR("error setting drm property for transparency key mode\n");
> > > + 			return -1;
> > > + 	}
> > > + 
> > > +-	/* Enable the LCD alpha blender */
> > > ++	/* Enable the LCD alpha blender */
> > > + 	if (drmModeObjectSetProperty(drm_device.fd,  drm_device.crtc_id,
> > > +-		DRM_MODE_OBJECT_CRTC, prop_alpha_blender, 1) < 0){
> > > ++		DRM_MODE_OBJECT_CRTC, drm_device.prop_id_alpha_blender, 1) < 0){
> > > + 			ERROR("error setting drm property for Alpha Blender\n");
> > > + 			return -1;
> > > +-	}
> > > ++	}
> > > + 	return 0;
> > > + }
> > > + 
> > > +@@ -785,7 +949,8 @@ static int capture_frame(struct 
> > > +v4l2_device_info *v4l2_device)  */  void default_parameters(void)  
> > > +{
> > > +-	/* Main camera display */
> > > ++	/* Main camera display */
> > > ++	memset(&drm_device, 0, sizeof(drm_device));
> > > + 	strcpy(drm_device.dev_name,"/dev/drm");
> > > + 	strcpy(drm_device.name,"drm");
> > > + 	drm_device.width=0;
> > > +@@ -852,8 +1017,10 @@ void exit_devices(void)  */  void 
> > > +end_streaming(void)  {
> > > +-        v4l2_stream_off(&cap0_device);
> > > +-        v4l2_stream_off(&cap1_device);
> > > ++	v4l2_stream_off(&cap0_device);
> > > ++	if (status.num_cams==2) {
> > > ++		v4l2_stream_off(&cap1_device);
> > > ++	}
> > > + }
> > > + 
> > > + /*
> > > +@@ -967,7 +1134,7 @@ Error:
> > > + * whether a jpeg image needs to be captured.
> > > + */
> > > + void process_frame(void) {
> > > +-
> > > ++
> > > + 	/* Display the main camera */
> > > + 	if (status.main_cam==0)
> > > + 		display_frame(&cap0_device, &drm_device, 0); @@ -980,7 +1147,7 
> > > +@@ void process_frame(void) {
> > > + 			display_frame(&cap1_device, &drm_device, 1);
> > > + 		else
> > > + 			display_frame(&cap0_device, &drm_device, 1);
> > > +-	}
> > > ++	}
> > > + 
> > > + 	/* Save jpeg image if triggered */
> > > + 	if (status.jpeg==true) {
> > > +diff --git a/loopback.h b/loopback.h index b20b996..4f468f4 100644
> > > +--- a/loopback.h
> > > ++++ b/loopback.h
> > > +@@ -10,6 +10,7 @@ struct control {
> > > +     int num_cams;
> > > +     int num_jpeg;
> > > +     int display_xres, display_yres;
> > > ++    int trans_key_mode;
> > > +     bool pip;
> > > +     bool jpeg;
> > > +     bool exit;
> > > +diff --git a/main.cpp b/main.cpp
> > > +index e73b061..c5c6900 100644
> > > +--- a/main.cpp
> > > ++++ b/main.cpp
> > > +@@ -1,23 +1,47 @@
> > > + #include <qglobal.h>
> > > + #include <QApplication>
> > > +-#include <QLabel>
> > > ++#include <QLabel>
> > > ++#include <QStringList>
> > > + 
> > > + #if QT_VERSION < 0x050000
> > > + #include <QWSServer>
> > > + #endif
> > > +-
> > > +-
> > > ++
> > > + #include <QPushButton>
> > > +-#include "mainwindow.h"
> > > ++#include "mainwindow.h"
> > > ++#include "loopback.h"
> > > ++
> > > + 
> > > + int main(int argc, char *argv[])
> > > + {
> > > +     QApplication a(argc, argv);
> > > +-    MainWindow w;
> > > ++    QStringList args = a.arguments();
> > > ++
> > > ++    /*
> > > ++     * Extract the trans key mode which is SoC specific and can be
> > > ++     * found at the corresponding TRM, for example,
> > > ++     * For AM437x: trans_key_mode = 1 GFX Dest Trans
> > > ++     *             TransKey applies to GFX overlay, marking which pixels come from VID overlays) 
> > > ++     * For AM57xx: trans_key_mode = 2 Source Key.
> > > ++     *             Match on Layer4 makes Layer4 transparent (zorder 3)
> > > ++     *
> > > ++     * The deault mode is 1 for backward compatibility
> > > ++     */
> > > ++
> > > ++    if((args.count() >= 2))
> > > ++    {
> > > ++        status.trans_key_mode = (args[1].toInt() == 2)?2:1;
> > > ++    }
> > > ++    else
> > > ++    {
> > > ++        status.trans_key_mode = 1;
> > > ++    }
> > > + 
> > > + #if QT_VERSION < 0x050000
> > > + 	QWSServer::setBackground(QBrush(QColor(0, 0, 0, 0))); -#endif
> > > ++#endif
> > > ++
> > > ++    MainWindow w;
> > > + 
> > > +     w.show();
> > > +     return a.exec();
> > > +--
> > > +1.9.1
> > > +
> > > diff --git 
> > > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/dual_camera_qt5.sh 
> > > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/dual_camera_qt5.sh
> > > index 4802337..5774a06 100644
> > > --- 
> > > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/dual_camera_qt5.sh
> > > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > > +++ era-demo/dual_camera_qt5.sh
> > > @@ -5,7 +5,7 @@ sleep 1
> > >  
> > >  echo 0 > /sys/class/graphics/fbcon/cursor_blink
> > >  
> > > -dual_camera -platform linuxfb
> > > +dual_camera 1 -platform linuxfb
> > >  
> > >  echo 1 > /sys/class/graphics/fbcon/cursor_blink
> > >  
> > > diff --git 
> > > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/dual_camera_qt5_omap-a15.sh 
> > > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo/dual_camera_qt5_omap-a15.sh
> > > new file mode 100644
> > > index 0000000..3d96cde
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > > +++ era-demo/dual_camera_qt5_omap-a15.sh
> > > @@ -0,0 +1,13 @@
> > > +#!/bin/bash
> > > +
> > > +/etc/init.d/weston stop
> > > +sleep 1
> > > +
> > > +echo 0 > /sys/class/graphics/fbcon/cursor_blink
> > > +
> > > +dual_camera 2 -platform linuxfb
> > > +
> > > +echo 1 > /sys/class/graphics/fbcon/cursor_blink
> > > +
> > > +/etc/init.d/weston start
> > > +sleep 1
> > > diff --git 
> > > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo_1.0.bb 
> > > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo_1.0.bb
> > > index 1b1a146..47d8ff3 100644
> > > --- 
> > > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > > demo_1.0.bb
> > > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > > +++ era-demo_1.0.bb
> > > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
> > >  DEPENDS += "libdrm"
> > >  require recipes-core/matrix/matrix-gui-paths.inc
> > >  
> > > -PR = "r13"
> > > +PR = "r14"
> > >  
> > >  BRANCH = "drm"
> > >  SRCREV = "3be10676149c5f6e0ef1660d6b1ee4b9165dd993"
> > > @@ -15,13 +15,16 @@ SRCREV = "3be10676149c5f6e0ef1660d6b1ee4b9165dd993"
> > >  SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
> > >             file://desc_dual-camera.html \
> > >             file://dual_camera_qt5.sh \
> > > +           file://dual_camera_qt5_omap-a15.sh \
> > >             file://dual_camera_qt4.sh \
> > >             file://dual-camera.desktop \
> > > +           
> > > + file://0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch 
> > > + \
> > >  "
> > >  
> > >  S = "${WORKDIR}/git"
> > >  
> > >  DEMO_SCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5.sh', 'dual_camera_qt4.sh', d)}"
> > > +DEMO_SCRIPT_omap-a15 = "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camera_qt5_omap-a15.sh', 'dual_camera_qt4.sh', d)}"
> > 
> > This will try to apply qt4 patch twice...
> 
> My bad - this is not append but an override, so should be fine.
> 
> --
> Denys

