Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 09521529EA
	for <meta-arago@arago-project.org>;
	Tue, 22 Mar 2016 22:20:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2MMKtkl007030
	for <meta-arago@arago-project.org>; Tue, 22 Mar 2016 17:20:55 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2MMKtIt009626
	for <meta-arago@arago-project.org>; Tue, 22 Mar 2016 17:20:55 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Tue, 22 Mar 2016 17:20:55 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] dual-camera-demo: Enhance to support both
	AM4 and AM5
Thread-Index: AQHRhHiXl1nIFU1UYEONqq4aFTYU059mWckA//+vPcA=
Date: Tue, 22 Mar 2016 22:20:54 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A1424C47D@DFLE09.ent.ti.com>
References: <1458677814-45157-1-git-send-email-e-ruei1@ti.com>
	<20160322202227.GO3298@edge> <20160322220908.GU3298@edge>
In-Reply-To: <20160322220908.GU3298@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 22 Mar 2016 22:20:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi, Denys:

Can you take the first patch? Or should I send the third one?

Best regards,

Eric
=20
-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 22, 2016 6:09 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] dual-camera-demo: Enhance to support both=
 AM4 and AM5

On Tue, Mar 22, 2016 at 04:22:27PM -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 22, 2016 at 04:16:54PM -0400, Eric Ruei wrote:
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  ...mera-demo-Enhance-to-support-both-AM4-AM5.patch | 469 +++++++++++++=
++++++++
> >  .../dual-camera-demo/dual_camera_qt5.sh            |   2 +-
> >  .../dual-camera-demo/dual_camera_qt5_omap-a15.sh   |  13 +
> >  .../dual-camera-demo/dual-camera-demo_1.0.bb       |   5 +-
> >  4 files changed, 487 insertions(+), 2 deletions(-)  create mode=20
> > 100644=20
> > meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > mo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch
> >  create mode 100644=20
> > meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-de
> > mo/dual_camera_qt5_omap-a15.sh
> >=20
> > diff --git=20
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch=20
> > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch
> > new file mode 100644
> > index 0000000..347438d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > +++ era-demo/0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.p
> > +++ atch
> > @@ -0,0 +1,469 @@
> > +From 86ed5c9c3f9b8e71cd9980f847623af0caf4c187 Mon Sep 17 00:00:00=20
> > +2001
> > +From: Eric Ruei <e-ruei1@ti.com>
> > +Date: Mon, 21 Mar 2016 16:27:58 -0400
> > +Subject: [PATCH] dual camera demo: Enhance to support both AM4/AM5
> > +
> > +- Initialize and restore DRM plane zorders
> > +- Add input parameter trans_key_mode (AM4:1;AM5:2)
> > +- Cleanup the exit sequence to avoid unnecessary operations and=20
> > +warnings
> > +
> > +
> > +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > +---
> > + loopback.c | 227 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
+--------
> > + loopback.h |   1 +
> > + main.cpp   |  36 ++++++++--
> > + 3 files changed, 228 insertions(+), 36 deletions(-)
> > +
> > +diff --git a/loopback.c b/loopback.c index dda0390..66052b3 100644
> > +--- a/loopback.c
> > ++++ b/loopback.c
> > +@@ -34,7 +34,9 @@
> > + #define FOURCC_STR(str)    FOURCC(str[0], str[1], str[2], str[3])
> > +=20
> > + #define PAGE_SHIFT 12
> > +-#define NBUF (3)
> > ++#define NBUF (3)
> > ++#define MAX_DRM_PLANES 5
> > ++
> > +=20
> > + struct control status;
> > +=20
> > +@@ -64,14 +66,22 @@ struct drm_device_info  {
> > + 	int fd;
> > + 	int width;
> > +-	int height;
> > ++	int height;
> > ++	unsigned int num_planes;
> > + 	char dev_name[9];
> > + 	char name[4];
> > + 	unsigned int bo_flags;
> > + 	struct dmabuf_buffer **buf[2];
> > + 	struct omap_device *dev;
> > + 	unsigned int crtc_id;
> > +-	unsigned plane_id[2];
> > ++	unsigned int plane_id[2];
> > ++	unsigned int prop_id_trans_key_mode;
> > ++	unsigned int prop_id_alpha_blender;
> > ++	unsigned int prop_id_zorder;
> > ++	uint64_t prop_value_trans_key_mode;
> > ++	uint64_t prop_value_alpha_blender;
> > ++	uint32_t prop_value_zorder[MAX_DRM_PLANES];
> > ++	uint32_t drm_plane_id[MAX_DRM_PLANES];
> > + 	bool multiplanar;	/* True when Y and U/V are in separate buffers. */
> > + } drm_device;
> > +=20
> > +@@ -500,6 +510,121 @@ struct dmabuf_buffer *v4l2_dequeue_buffer(struct=
 v4l2_device_info *device)
> > + 	}
> > +=20
> > + 	return buf;
> > ++}
> > ++
> > ++/*
> > ++ * Reorder the zorder of DRM planes to the desired order for demo
> > ++ *      VID1: 1
> > ++ *      VID2: 2
> > ++ *      CRTC: 3
> > ++ */
> > ++
> > ++int drm_init_plane_zorder(struct drm_device_info *device) {
> > ++	int i,j;
> > ++	drmModePlaneRes *res;
> > ++	drmModePlane *plane;
> > ++	drmModeObjectProperties *props;
> > ++	drmModePropertyRes *props_info;
> > ++	uint32_t zorder=3D1;
> > ++	int ret =3D 0;
> > ++
> > ++	// This will explain the planes to include CRTC, but setPlane is not=
 applicable to=20
> > ++	// the CRTC plane
> > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> > ++
> > ++	res =3D drmModeGetPlaneResources(device->fd);
> > ++
> > ++	if(res =3D=3D NULL){
> > ++		ERROR("plane resources not found\n");
> > ++		ret =3D -1;
> > ++		goto drm_init_plane_zorder_error;
> > ++	}
> > ++
> > ++	//DBG("drm_init_plane_zorder:no. of planes =3D %d\n",=20
> > ++res->count_planes);
> > ++
> > ++	if (res->count_planes > MAX_DRM_PLANES)
> > ++	{
> > ++
> > ++		ERROR("There are two many DRM planes (%d > %d)\n", res->count_plane=
s, MAX_DRM_PLANES);
> > ++		ret =3D -1;
> > ++		goto drm_init_plane_zorder_error;
> > ++	}
> > ++
> > ++	device->num_planes =3D res->count_planes;
> > ++	for (i =3D 0; i < res->count_planes; i++) {
> > ++		uint32_t plane_id =3D res->planes[i];
> > ++		bool fCRTC =3D 0;
> > ++		uint32_t zorder_value =3D 3;
> > ++
> > ++		drmModePlane *plane =3D drmModeGetPlane(device->fd, plane_id);
> > ++		if(plane =3D=3D NULL){
> > ++			ERROR("plane (%d) not found\n", plane_id);
> > ++			continue;
> > ++		}
> > ++
> > ++		// TBD: check for required plane attributes
> > ++		device->drm_plane_id[i] =3D plane->plane_id;
> > ++
> > ++		props =3D drmModeObjectGetProperties(device->fd, plane->plane_id,=20
> > ++DRM_MODE_OBJECT_PLANE);
> > ++
> > ++		if(props =3D=3D NULL){
> > ++			ERROR("plane (%d) properties not found\n",  plane->plane_id);
> > ++			continue;
> > ++		}
> > ++
> > ++		for (j =3D 0; j < props->count_props; j++)
> > ++		{
> > ++			props_info =3D drmModeGetProperty(device->fd, props->props[j]);
> > ++
> > ++			if(props_info =3D=3D NULL){
> > ++				ERROR("plane(%d) props[%d] not found\n", plane->plane_id, j);
> > ++				continue;
> > ++			}
> > ++
> > ++			if (strcmp("type", props_info->name) =3D=3D 0)
> > ++			{
> > ++				fCRTC =3D (props->prop_values[j] =3D=3D 1)?1:0;
> > ++			}
> > ++			else if ((strcmp("zorder", props_info->name) =3D=3D 0))
> > ++			{
> > ++				if (!device->prop_id_zorder)
> > ++				{
> > ++					device->prop_id_zorder =3D props_info->prop_id;
> > ++				}
> > ++				device->prop_value_zorder[i] =3D (uint32_t)props->prop_values[j];
> > ++			}
> > ++
> > ++			drmModeFreeProperty(props_info);
> > ++		}
> > ++
> > ++		/* Re-arrange zorder */
> > ++		if (!fCRTC)
> > ++		{
> > ++			zorder_value =3D zorder++;
> > ++		}
> > ++
> > ++		j =3D drmModeObjectSetProperty(device->fd, plane->plane_id,
> > ++									 DRM_MODE_OBJECT_PLANE, device->prop_id_zorder,
> > ++									(uint64_t)zorder_value);
> > ++
> > ++		if (j < 0) {
> > ++			ERROR("set z-order for plane id %d failed\n", plane->plane_id);
> > ++		}
> > ++
> > ++		drmModeFreeObjectProperties(props);
> > ++		drmModeFreePlane(plane);
> > ++
> > ++	}
> > ++
> > ++	drmModeFreePlaneResources(res);
> > ++
> > ++drm_init_plane_zorder_error:
> > ++
> > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> > ++
> > ++	return(ret);
> > ++
> > + }
> > +=20
> > + uint32_t drm_reserve_plane(int fd) @@ -508,7 +633,7 @@ uint32_t=20
> > +drm_reserve_plane(int fd)
> > + 	drmModePlaneRes *res =3D drmModeGetPlaneResources(fd);
> > + 	if(res =3D=3D NULL){
> > + 		ERROR("plane resources not found\n");
> > +-	}
> > ++	}
> > +=20
> > + 	for (i =3D 0; i < res->count_planes; i++) {
> > + 		uint32_t plane_id =3D res->planes[i]; @@ -520,7 +645,7 @@ uint32_t=
=20
> > +drm_reserve_plane(int fd)
> > + 			continue;
> > +=20
> > + 		drmModePlane *plane =3D drmModeGetPlane(fd, plane_id);
> > +-		if(res =3D=3D NULL){
> > ++		if(plane =3D=3D NULL){
> > + 			ERROR("plane  not found\n");
> > + 		}
> > +=20
> > +@@ -577,9 +702,45 @@ void drm_crtc_resolution(struct drm_device_info *=
device)
> > + 		device->height =3D crtc->height;
> > +=20
> > + 		drmModeFreeCrtc(crtc);
> > +-		drmModeFreeResources(res);
> > ++	}
> > ++
> > ++	drmModeFreeResources(res);
> > ++
> > ++}
> > ++
> > ++/*
> > ++ * DRM restore properties
> > ++ */
> > ++static void drm_restore_props(struct drm_device_info *device) {
> > ++	unsigned int i;
> > ++
> > ++	/* restore the original zorder of DRM planes */
> > ++
> > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> > ++
> > ++	for (i =3D 0; i < device->num_planes; i++) {
> > ++		if (device->drm_plane_id[i])
> > ++		{
> > ++			drmModeObjectSetProperty(device->fd, device->drm_plane_id[i],
> > ++									 DRM_MODE_OBJECT_PLANE, device->prop_id_zorder,
> > ++									 (uint64_t)device->prop_value_zorder[i]);
> > ++		}
> > + 	}
> > +-}
> > ++
> > ++	drmSetClientCap(device->fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> > ++
> > ++	if(device->prop_id_trans_key_mode){
> > ++		drmModeObjectSetProperty(device->fd,  device->crtc_id,
> > ++			DRM_MODE_OBJECT_CRTC, device->prop_id_trans_key_mode, device->prop=
_value_trans_key_mode);
> > ++	}
> > ++
> > ++	if(device->prop_id_alpha_blender){
> > ++		drmModeObjectSetProperty(device->fd,  device->crtc_id,
> > ++			DRM_MODE_OBJECT_CRTC, device->prop_id_alpha_blender, device->prop_=
value_alpha_blender);
> > ++	}
> > ++}
> > ++
> > + /*
> > + * drm device init
> > + */
> > +@@ -587,12 +748,14 @@ static int drm_init_device(struct=20
> > +drm_device_info *device)  {
> > + 	unsigned char j;
> > +=20
> > +-	if (!device->fd) {
> > ++	if (!device->fd) {
> > + 		device->fd =3D drmOpen("omapdrm", NULL);
> > + 		if (device->fd < 0) {
> > + 			ERROR("could not open drm device: %s (%d)", strerror(errno), errno=
);
> > + 			return -1;
> > +-		}
> > ++		}
> > ++		if (drm_init_plane_zorder(device))
> > ++			return -1;
> > + 	}
> > +=20
> > + 	device->dev =3D omap_device_new(device->fd); @@ -600,16 +763,15 @@=20
> > +static int drm_init_device(struct drm_device_info *device)
> > + 	/* Get CRTC id and resolution. As well set the global display width =
and height */
> > + 	drm_crtc_resolution(device);
> > +=20
> > +-
> > + 	/* Store display resolution so GUI can be configured */
> > + 	status.display_xres =3D device->width;
> > +-	status.display_yres =3D device->height;
> > ++	status.display_yres =3D device->height;
> > +=20
> > + 	/* AM437x has two video planes and one graphics plane.  */
> > + 	/* Get one video plane  for each camera                 */
> > + 	for (j =3D 0; j < status.num_cams; j++) {
> > +=20
> > +-		device->plane_id[j] =3D drm_reserve_plane(device->fd);
> > ++		device->plane_id[j] =3D drm_reserve_plane(device->fd);
> > + 	}
> > +=20
> > + 	return 0;
> > +@@ -619,7 +781,9 @@ static int drm_init_device(struct=20
> > +drm_device_info *device)  *Clean resources while exiting drm device =20
> > +*/  static void drm_exit_device(struct drm_device_info *device) -{
> > ++{
> > ++
> > ++	drm_restore_props(device);
> > + 	omap_device_del(device->dev);
> > + 	device->dev =3D NULL;
> > +=20
> > +@@ -637,8 +801,6 @@ static int drm_init_dss(void)  {
> > + 	drmModeObjectProperties *props;
> > + 	drmModePropertyRes *propRes;
> > +-	unsigned int prop_trans_key_mode =3D 0;
> > +-	unsigned int prop_alpha_blender =3D 0;
> > + 	unsigned int j;
> > +=20
> > + 	props =3D drmModeObjectGetProperties(drm_device.fd,=20
> > +drm_device.crtc_id, @@ -651,41 +813,43 @@ static int drm_init_dss(void=
)
> > + 			continue;
> > +=20
> > + 		if (strcmp(propRes->name, "trans-key-mode") =3D=3D 0) {
> > +-			prop_trans_key_mode =3D props->props[j];
> > ++			drm_device.prop_id_trans_key_mode =3D props->props[j];
> > ++			drm_device.prop_value_trans_key_mode =3D props->prop_values[j];
> > + 		}
> > +=20
> > + 		if (strcmp(propRes->name, "alpha_blender") =3D=3D 0) {
> > +-			prop_alpha_blender =3D props->props[j];
> > ++			drm_device.prop_id_alpha_blender =3D props->props[j];
> > ++			drm_device.prop_value_alpha_blender =3D props->prop_values[j];
> > + 		}
> > +=20
> > +-		if(prop_alpha_blender & prop_trans_key_mode){
> > ++		if(drm_device.prop_id_trans_key_mode &=20
> > ++drm_device.prop_id_alpha_blender){
> > + 			break;
> > + 		}
> > + 	}
> > +=20
> > +-	if(prop_trans_key_mode =3D=3D 0){
> > +-		ERROR("TRANSPARENCY PROPERTY NOT FOUND\n");
> > ++	if(drm_device.prop_id_trans_key_mode =3D=3D 0){
> > ++		ERROR("TRANSPARENCY PROPERTY NOT FOUND\n");
> > + 		return -1;
> > + 	}
> > +=20
> > +-	if(prop_alpha_blender =3D=3D 0){
> > ++	if(drm_device.prop_id_alpha_blender =3D=3D 0){
> > + 		ERROR("ALPHA BLENDER PROPERTY NOT FOUND\n");
> > + 		return -1;
> > + 	}
> > +=20
> > + 	/* Enable the transparency color key */
> > + 	if (drmModeObjectSetProperty(drm_device.fd,  drm_device.crtc_id,
> > +-		DRM_MODE_OBJECT_CRTC, prop_trans_key_mode, 1) < 0) {
> > ++		DRM_MODE_OBJECT_CRTC, drm_device.prop_id_trans_key_mode,=20
> > ++status.trans_key_mode) < 0) {
> > + 			ERROR("error setting drm property for transparency key mode\n");
> > + 			return -1;
> > + 	}
> > +=20
> > +-	/* Enable the LCD alpha blender */
> > ++	/* Enable the LCD alpha blender */
> > + 	if (drmModeObjectSetProperty(drm_device.fd,  drm_device.crtc_id,
> > +-		DRM_MODE_OBJECT_CRTC, prop_alpha_blender, 1) < 0){
> > ++		DRM_MODE_OBJECT_CRTC, drm_device.prop_id_alpha_blender, 1) < 0){
> > + 			ERROR("error setting drm property for Alpha Blender\n");
> > + 			return -1;
> > +-	}
> > ++	}
> > + 	return 0;
> > + }
> > +=20
> > +@@ -785,7 +949,8 @@ static int capture_frame(struct=20
> > +v4l2_device_info *v4l2_device)  */  void default_parameters(void) =20
> > +{
> > +-	/* Main camera display */
> > ++	/* Main camera display */
> > ++	memset(&drm_device, 0, sizeof(drm_device));
> > + 	strcpy(drm_device.dev_name,"/dev/drm");
> > + 	strcpy(drm_device.name,"drm");
> > + 	drm_device.width=3D0;
> > +@@ -852,8 +1017,10 @@ void exit_devices(void)  */  void=20
> > +end_streaming(void)  {
> > +-        v4l2_stream_off(&cap0_device);
> > +-        v4l2_stream_off(&cap1_device);
> > ++	v4l2_stream_off(&cap0_device);
> > ++	if (status.num_cams=3D=3D2) {
> > ++		v4l2_stream_off(&cap1_device);
> > ++	}
> > + }
> > +=20
> > + /*
> > +@@ -967,7 +1134,7 @@ Error:
> > + * whether a jpeg image needs to be captured.
> > + */
> > + void process_frame(void) {
> > +-
> > ++
> > + 	/* Display the main camera */
> > + 	if (status.main_cam=3D=3D0)
> > + 		display_frame(&cap0_device, &drm_device, 0); @@ -980,7 +1147,7=20
> > +@@ void process_frame(void) {
> > + 			display_frame(&cap1_device, &drm_device, 1);
> > + 		else
> > + 			display_frame(&cap0_device, &drm_device, 1);
> > +-	}
> > ++	}
> > +=20
> > + 	/* Save jpeg image if triggered */
> > + 	if (status.jpeg=3D=3Dtrue) {
> > +diff --git a/loopback.h b/loopback.h index b20b996..4f468f4 100644
> > +--- a/loopback.h
> > ++++ b/loopback.h
> > +@@ -10,6 +10,7 @@ struct control {
> > +     int num_cams;
> > +     int num_jpeg;
> > +     int display_xres, display_yres;
> > ++    int trans_key_mode;
> > +     bool pip;
> > +     bool jpeg;
> > +     bool exit;
> > +diff --git a/main.cpp b/main.cpp
> > +index e73b061..c5c6900 100644
> > +--- a/main.cpp
> > ++++ b/main.cpp
> > +@@ -1,23 +1,47 @@
> > + #include <qglobal.h>
> > + #include <QApplication>
> > +-#include <QLabel>
> > ++#include <QLabel>
> > ++#include <QStringList>
> > +=20
> > + #if QT_VERSION < 0x050000
> > + #include <QWSServer>
> > + #endif
> > +-
> > +-
> > ++
> > + #include <QPushButton>
> > +-#include "mainwindow.h"
> > ++#include "mainwindow.h"
> > ++#include "loopback.h"
> > ++
> > +=20
> > + int main(int argc, char *argv[])
> > + {
> > +     QApplication a(argc, argv);
> > +-    MainWindow w;
> > ++    QStringList args =3D a.arguments();
> > ++
> > ++    /*
> > ++     * Extract the trans key mode which is SoC specific and can be
> > ++     * found at the corresponding TRM, for example,
> > ++     * For AM437x: trans_key_mode =3D 1 GFX Dest Trans
> > ++     *             TransKey applies to GFX overlay, marking which pix=
els come from VID overlays)=20
> > ++     * For AM57xx: trans_key_mode =3D 2 Source Key.
> > ++     *             Match on Layer4 makes Layer4 transparent (zorder 3=
)
> > ++     *
> > ++     * The deault mode is 1 for backward compatibility
> > ++     */
> > ++
> > ++    if((args.count() >=3D 2))
> > ++    {
> > ++        status.trans_key_mode =3D (args[1].toInt() =3D=3D 2)?2:1;
> > ++    }
> > ++    else
> > ++    {
> > ++        status.trans_key_mode =3D 1;
> > ++    }
> > +=20
> > + #if QT_VERSION < 0x050000
> > + 	QWSServer::setBackground(QBrush(QColor(0, 0, 0, 0))); -#endif
> > ++#endif
> > ++
> > ++    MainWindow w;
> > +=20
> > +     w.show();
> > +     return a.exec();
> > +--
> > +1.9.1
> > +
> > diff --git=20
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/dual_camera_qt5.sh=20
> > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/dual_camera_qt5.sh
> > index 4802337..5774a06 100644
> > ---=20
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/dual_camera_qt5.sh
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > +++ era-demo/dual_camera_qt5.sh
> > @@ -5,7 +5,7 @@ sleep 1
> > =20
> >  echo 0 > /sys/class/graphics/fbcon/cursor_blink
> > =20
> > -dual_camera -platform linuxfb
> > +dual_camera 1 -platform linuxfb
> > =20
> >  echo 1 > /sys/class/graphics/fbcon/cursor_blink
> > =20
> > diff --git=20
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/dual_camera_qt5_omap-a15.sh=20
> > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo/dual_camera_qt5_omap-a15.sh
> > new file mode 100644
> > index 0000000..3d96cde
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > +++ era-demo/dual_camera_qt5_omap-a15.sh
> > @@ -0,0 +1,13 @@
> > +#!/bin/bash
> > +
> > +/etc/init.d/weston stop
> > +sleep 1
> > +
> > +echo 0 > /sys/class/graphics/fbcon/cursor_blink
> > +
> > +dual_camera 2 -platform linuxfb
> > +
> > +echo 1 > /sys/class/graphics/fbcon/cursor_blink
> > +
> > +/etc/init.d/weston start
> > +sleep 1
> > diff --git=20
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo_1.0.bb=20
> > b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo_1.0.bb
> > index 1b1a146..47d8ff3 100644
> > ---=20
> > a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-
> > demo_1.0.bb
> > +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-cam
> > +++ era-demo_1.0.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3=
354a64feeb4f19f52eb5"
> >  DEPENDS +=3D "libdrm"
> >  require recipes-core/matrix/matrix-gui-paths.inc
> > =20
> > -PR =3D "r13"
> > +PR =3D "r14"
> > =20
> >  BRANCH =3D "drm"
> >  SRCREV =3D "3be10676149c5f6e0ef1660d6b1ee4b9165dd993"
> > @@ -15,13 +15,16 @@ SRCREV =3D "3be10676149c5f6e0ef1660d6b1ee4b9165dd99=
3"
> >  SRC_URI =3D "git://git.ti.com/sitara-linux/dual-camera-demo.git;protoc=
ol=3Dgit;branch=3D${BRANCH} \
> >             file://desc_dual-camera.html \
> >             file://dual_camera_qt5.sh \
> > +           file://dual_camera_qt5_omap-a15.sh \
> >             file://dual_camera_qt4.sh \
> >             file://dual-camera.desktop \
> > +          =20
> > + file://0001-dual-camera-demo-Enhance-to-support-both-AM4-AM5.patch=20
> > + \
> >  "
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
> >  DEMO_SCRIPT =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'dual_camer=
a_qt5.sh', 'dual_camera_qt4.sh', d)}"
> > +DEMO_SCRIPT_omap-a15 =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'd=
ual_camera_qt5_omap-a15.sh', 'dual_camera_qt4.sh', d)}"
>=20
> This will try to apply qt4 patch twice...

My bad - this is not append but an override, so should be fine.

--
Denys

