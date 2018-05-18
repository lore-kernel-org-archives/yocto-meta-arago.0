Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 476D2529B2
	for <meta-arago@arago-project.org>;
	Fri, 18 May 2018 18:51:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4IIppbs019241
	for <meta-arago@arago-project.org>; Fri, 18 May 2018 13:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526669511;
	bh=fCWDKPhomIzqauz8avStsnDc+Kwn/Zx6sOYbkoMrtqI=;
	h=From:To:Subject:Date;
	b=fe/lIfSqRwJEWzxRgxBlmNUCt5QIVa2yCItHA23wF5jXJGhmVBKBDKtQnJn4osrqi
	trKa2TLCbNyzDkh3Gq4nN88wtEttuCyRcsPo40lqw+qufEgPBHy59LBApmmDtyH43d
	DUk98zIX3r6NlIq5AAnhX5+P0WWMJiz59zL3P1Yk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4IIppJC027730
	for <meta-arago@arago-project.org>; Fri, 18 May 2018 13:51:51 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 18 May 2018 13:51:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 18 May 2018 13:51:50 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4IIpoPA032005
	for <meta-arago@arago-project.org>; Fri, 18 May 2018 13:51:50 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 May 2018 14:51:18 -0400
Message-ID: <1526669478-58503-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] qtbase: rebase eglfs_kms enhancements for multiple-display support
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
X-List-Received-Date: Fri, 18 May 2018 18:51:57 -0000
Content-Type: text/plain

Rebase the the eglfs-kms QPA enhancements for QT 5.9.5
- multiple-display support
- user-interface enhancements

This is the final version for QT5.9.5 and significant changes may be
required for new version of QT5. Therefore, upstream will not be considered
until then.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...nhance-the-QPA-for-multiple-display-and-u.patch | 2214 ++++++++++----------
 recipes-qt/qt5/qtbase_%.bbappend                   |    4 +-
 2 files changed, 1070 insertions(+), 1148 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch b/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
index 2784906..798205c 100644
--- a/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
+++ b/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
@@ -1,6 +1,6 @@
-From 038932af411049c1dc6cbe0dc3f963b9b539efa8 Mon Sep 17 00:00:00 2001
+From f383ddedeb19e87d987b4146a20b7c9e7ea2808e Mon Sep 17 00:00:00 2001
 From: Manisha Agrawal <manisha.agrawal@ti.com>
-Date: Tue, 13 Feb 2018 16:36:38 -0600
+Date: Fri, 18 May 2018 09:23:31 -0400
 Subject: [PATCH] eglfs_kms: enhance the QPA for multiple display and user
  buffer
 
@@ -22,1359 +22,1281 @@ stop displaying of user/overlay plane.
 
 Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
 ---
- .../eglfs_kms/qeglfskmsgbmdevice.cpp               |  63 ++++-
- .../eglfs_kms/qeglfskmsgbmdevice.h                 |  15 +-
- .../eglfs_kms/qeglfskmsgbmintegration.cpp          | 105 +++++++-
- .../eglfs_kms/qeglfskmsgbmintegration.h            |  14 +-
- .../eglfs_kms/qeglfskmsgbmscreen.cpp               | 272 ++++++++++++++++++++-
- .../eglfs_kms/qeglfskmsgbmscreen.h                 |  38 ++-
- .../eglfs_kms_support/qeglfskmsdevice.cpp          | 211 +++++++++++++++-
- .../eglfs_kms_support/qeglfskmsdevice.h            |  16 +-
- .../eglfs_kms_support/qeglfskmsscreen.h            |   2 +
- .../platforms/eglfs/qeglfsdeviceintegration.cpp    |  88 +++++++
- .../platforms/eglfs/qeglfsdeviceintegration.h      |  15 +-
- src/plugins/platforms/eglfs/qeglfsintegration.cpp  | 106 +++++++-
- 12 files changed, 895 insertions(+), 50 deletions(-)
+ src/platformsupport/kmsconvenience/qkmsdevice.cpp  | 208 +++++++++++++++-
+ src/platformsupport/kmsconvenience/qkmsdevice_p.h  |  14 +-
+ .../eglfs/api/qeglfsdeviceintegration.cpp          |  87 +++++++
+ .../eglfs/api/qeglfsdeviceintegration_p.h          |  14 ++
+ .../platforms/eglfs/api/qeglfsintegration.cpp      | 106 +++++++-
+ .../eglfs_kms/qeglfskmsgbmdevice.cpp               |  63 +++--
+ .../eglfs_kms/qeglfskmsgbmdevice.h                 |  16 +-
+ .../eglfs_kms/qeglfskmsgbmintegration.cpp          | 103 ++++++++
+ .../eglfs_kms/qeglfskmsgbmintegration.h            |  13 +
+ .../eglfs_kms/qeglfskmsgbmscreen.cpp               | 270 +++++++++++++++++++--
+ .../eglfs_kms/qeglfskmsgbmscreen.h                 |  39 +++
+ 11 files changed, 886 insertions(+), 47 deletions(-)
 
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-index 278752bddf..63de320c0f 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-@@ -54,6 +54,31 @@ QT_BEGIN_NAMESPACE
- 
- Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
+diff --git a/src/platformsupport/kmsconvenience/qkmsdevice.cpp b/src/platformsupport/kmsconvenience/qkmsdevice.cpp
+index a8eefe6..a6478ed 100644
+--- a/src/platformsupport/kmsconvenience/qkmsdevice.cpp
++++ b/src/platformsupport/kmsconvenience/qkmsdevice.cpp
+@@ -61,6 +61,179 @@ enum OutputConfiguration {
+     OutputConfigModeline
+ };
  
-+class DrmPageFlipHandler : public QThread
++int QKmsDevice::getDrmPropId(drmModeObjectPropertiesPtr props,
++                                  const char *name, uint32_t *propId)
 +{
-+public:
-+    DrmPageFlipHandler(QEglFSKmsGbmDevice *gbm_device)
-+        : m_abort(false), m_gbm_device(gbm_device)  {}
-+    bool m_abort;
-+    void run();
++    drmModePropertyPtr p;
++    unsigned int i;
++    *propId = 0;/* Property ID should always be > 0 */
 +
-+private:
-+    QEglFSKmsGbmDevice *m_gbm_device;
-+};
++    for (i = 0; i < props->count_props; i++) {
++        p = drmModeGetProperty(m_dri_fd, props->props[i]);
++        if (!strcmp(p->name, name)){
++            *propId = p->prop_id;
++            break;
++        }
++        drmModeFreeProperty(p);
++    }
++    if (!*propId) {
++        qWarning() << "getDrmPropId: Could not find" <<  name << "property";
++        return(-1);
++    }
 +
-+void DrmPageFlipHandler::run()
++    return i;
++}
++
++int QKmsDevice::setPlaneProperties(uint32_t objectType, uint32_t crtcId,
++                                        uint32_t planeId, uint8_t num_prop, const char **propName,
++                                        uint32_t *propVal)
 +{
-+    drmEventContext drmEvent = {
-+        DRM_EVENT_CONTEXT_VERSION,
-+        Q_NULLPTR,      // vblank handler
-+        QEglFSKmsGbmDevice::pageFlipHandler // page flip handler
-+    };
++    int ret, i;
++    uint32_t objectId;
++    if(objectType == DRM_MODE_OBJECT_PLANE){
++        objectId = planeId;
++    }
++    else{
++        objectId = crtcId;
++    }
++    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, objectId,
++        objectType);
 +
-+    while(m_abort == false){
-+        drmHandleEvent(m_gbm_device->fd(), &drmEvent);
++    if(props == NULL){
++        qWarning() << "setPlaneProperties: drm object properties for objectId" << objectId << "is NULL";
++        return (-1);
 +    }
-+}
 +
- void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
- {
-     Q_UNUSED(fd);
-@@ -61,8 +86,17 @@ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned
-     Q_UNUSED(tv_sec);
-     Q_UNUSED(tv_usec);
- 
--    QEglFSKmsScreen *screen = static_cast<QEglFSKmsScreen *>(user_data);
--    screen->flipFinished();
-+    QEglFSKmsGbmScreen *screen = static_cast<QEglFSKmsGbmScreen *>(user_data);
++    drmModeAtomicReqPtr req = drmModeAtomicAlloc();
++    uint32_t propId;
 +
-+    if(screen->m_qpa_flip_call == true){
-+        screen->flipFinished();
++    for(i = 0; i < num_prop; i++)
++    {
++        if (getDrmPropId(props, propName[i], &propId) < 0){
++            qWarning() << "setPlaneProperties: failed to get the DRM property id for " <<  propName[i];
++            goto error_exit;
++        }
++        if(drmModeAtomicAddProperty(req, objectId, propId, propVal[i]) < 0){
++            qWarning() << "setPlaneProperties: failed to add DRM property for" << propName[i];
++            goto error_exit;
++        }
 +    }
 +
-+    if(screen->m_user_flip_call == true){
-+        screen->m_hndl_user_callback(screen->m_user_data);
++    if(objectType == DRM_MODE_OBJECT_PLANE){
++        if(getDrmPropId(props, "CRTC_ID", &propId) < 0){
++            qWarning() << "setPlaneProperties: failed to get the DRM property id for CRTC_ID";
++            goto error_exit;
++        }
++        if(drmModeAtomicAddProperty(req, planeId, propId, crtcId) < 0){
++            qWarning() << "setPlaneProperties: failed to add DRM property for CRTC_ID";
++            goto error_exit;
++        }
 +    }
 +
-+    screen->m_flip_event.release(1);
- }
- 
- QEglFSKmsGbmDevice::QEglFSKmsGbmDevice(QEglFSKmsIntegration *integration, const QString &path)
-@@ -94,26 +128,40 @@ bool QEglFSKmsGbmDevice::open()
-         return false;
-     }
- 
-+    drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-+    drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1);
-     setFd(fd);
- 
-+    m_drm_page_flip_handler = new DrmPageFlipHandler(this);
-+    m_drm_page_flip_handler->start();
-     return true;
- }
- 
- void QEglFSKmsGbmDevice::close()
- {
-+    // Terminate the device thread
-     if (m_gbm_device) {
-         gbm_device_destroy(m_gbm_device);
-         m_gbm_device = Q_NULLPTR;
-     }
-+    m_drm_page_flip_handler->m_abort = true;
-+    m_drm_page_flip_handler->wait();
-+    delete m_drm_page_flip_handler;
-+    m_drm_page_flip_handler = 0;
- 
-     if (fd() != -1) {
-+        drmSetClientCap(fd(), DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-+        drmSetClientCap(fd(), DRM_CLIENT_CAP_ATOMIC, 0);
-         qt_safe_close(fd());
-+        qWarning("QEglFSKmsGBmDevice::close(): close DRM %d", fd());
-         setFd(-1);
-     }
- 
-     if (m_globalCursor)
-         m_globalCursor->deleteLater();
-     m_globalCursor = Q_NULLPTR;
-+    qWarning("QEglFSKmsGbmDevice::close(): delete global cursor");
++    ret = drmModeAtomicCommit(m_dri_fd, req, DRM_MODE_ATOMIC_TEST_ONLY, 0);
 +
- }
- 
- EGLNativeDisplayType QEglFSKmsGbmDevice::nativeDisplay() const
-@@ -131,17 +179,6 @@ QPlatformCursor *QEglFSKmsGbmDevice::globalCursor() const
-     return m_globalCursor;
- }
- 
--void QEglFSKmsGbmDevice::handleDrmEvent()
--{
--    drmEventContext drmEvent = {
--        DRM_EVENT_CONTEXT_VERSION,
--        Q_NULLPTR,      // vblank handler
--        pageFlipHandler // page flip handler
--    };
--
--    drmHandleEvent(fd(), &drmEvent);
--}
--
- QEglFSKmsScreen *QEglFSKmsGbmDevice::createScreen(QEglFSKmsIntegration *integration, QEglFSKmsDevice *device, QEglFSKmsOutput output, QPoint position)
- {
-     static bool firstScreen = true;
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-index 6a45f9ffa0..30411dfa9e 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-@@ -50,7 +50,7 @@
- QT_BEGIN_NAMESPACE
- 
- class QEglFSKmsScreen;
--
-+class DrmPageFlipHandler;
- class QEglFSKmsGbmDevice: public QEglFSKmsDevice
- {
- public:
-@@ -64,12 +64,15 @@ public:
- 
-     QPlatformCursor *globalCursor() const;
- 
--    void handleDrmEvent();
--
-     virtual QEglFSKmsScreen *createScreen(QEglFSKmsIntegration *integration,
-                                           QEglFSKmsDevice *device,
-                                           QEglFSKmsOutput output,
-                                           QPoint position) Q_DECL_OVERRIDE;
-+    static void pageFlipHandler(int fd,
-+                                unsigned int sequence,
-+                                unsigned int tv_sec,
-+                                unsigned int tv_usec,
-+                                void *user_data);
- 
- private:
-     Q_DISABLE_COPY(QEglFSKmsGbmDevice)
-@@ -78,11 +81,7 @@ private:
- 
-     QEglFSKmsGbmCursor *m_globalCursor;
- 
--    static void pageFlipHandler(int fd,
--                                unsigned int sequence,
--                                unsigned int tv_sec,
--                                unsigned int tv_usec,
--                                void *user_data);
-+    DrmPageFlipHandler *m_drm_page_flip_handler;
- };
- 
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-index 1c0a8e1b5f..b1f64c2992 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-@@ -59,7 +59,7 @@
- #include <gbm.h>
- 
- QT_BEGIN_NAMESPACE
--
-+Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
- QMutex QEglFSKmsGbmScreen::m_waitForFlipMutex;
- 
- QEglFSKmsGbmIntegration::QEglFSKmsGbmIntegration()
-@@ -140,4 +140,107 @@ QEglFSKmsDevice *QEglFSKmsGbmIntegration::createDevice(const QString &devicePath
-     return new QEglFSKmsGbmDevice(this, path);
- }
- 
-+int QEglFSKmsGbmIntegration::exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
-+                                          uint32_t pixel_format, uint32_t *strides, uint32_t *offsets, 
-+                                          uint32_t buf_fd, uint32_t *buf_id)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return (gbmScreen->addOverlayBuffer(width, 
-+            height, pixel_format, strides, offsets, buf_fd, buf_id));
++    if(!ret){
++        drmModeAtomicCommit(m_dri_fd, req, 0, 0);
++    }
++    else{
++        qWarning() << "setPlaneProperties: ret from drmModeAtomicCommit = " <<  ret;
++        goto error_exit;
 +    }
 +
++    drmModeAtomicFree(req);
++    drmModeFreeObjectProperties(props);
++    return 0;
++
++error_exit:
++    drmModeAtomicFree(req);
++    drmModeFreeObjectProperties(props);
 +    return -1;
 +}
 +
-+int QEglFSKmsGbmIntegration::distroyBuffer(const QScreen *screen, uint32_t buf_id)
++int QKmsDevice::getPlaneProperty(uint32_t objectType, uint32_t planeId,
++                                      const char *propName)
 +{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return (gbmScreen->removeOverlayBuffer(buf_id));
-+    }
++    uint32_t propId;
++    int propVal = -1, propIndx;
 +
-+    return -1;
-+}
++    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, planeId,
++        objectType);
 +
-+int QEglFSKmsGbmIntegration::setPlaneProperties(const QScreen *screen, 
-+                                                uint8_t planeType, uint8_t idx, uint8_t num_prop, 
-+                                                const char **propName, uint32_t *propVal)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return(gbmScreen->setPlaneProperties(planeType, idx, num_prop, propName, propVal));
++    if(props == NULL){
++        qWarning() << "getPlaneProperty: drm obeject properties for plane type is NULL\n";
++        return (-1);
 +    }
 +
-+    return -1;
-+}
++    propIndx = getDrmPropId(props, propName, &propId);
 +
-+int QEglFSKmsGbmIntegration::getPlaneProperty(const QScreen *screen, 
-+                                              uint8_t planeType, uint8_t idx, const char *propName)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return(gbmScreen->getPlaneProperty(planeType, idx, propName));
++    if(propIndx >= 0){
++        propVal = props->prop_values[propIndx];
++    }
++    else{
++        qWarning() << "getPlaneProperty: Couldn't get DRM plane property for" << *propName;
++        return -1;
 +    }
++    drmModeFreeObjectProperties(props);
 +
-+    return -1;
++    return propVal;
 +}
 +
-+int QEglFSKmsGbmIntegration::createPlane(const QScreen *screen)
++int QKmsDevice::getPlane(uint32_t crtc_id, uint8_t planeType)
 +{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return(gbmScreen->createOverlayPlane());		
-+    }
-+    return -1;
-+}
++    uint32_t i;
++    drmModeObjectProperties *props;
++    drmModePlaneRes *res = drmModeGetPlaneResources(m_dri_fd);
 +
-+int QEglFSKmsGbmIntegration::distroyPlane(const QScreen *screen, int planeId)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return(gbmScreen->distroyOverlayPlane(planeId));		
-+    }
-+    return -1;
-+}
-+
-+int QEglFSKmsGbmIntegration::queuePlane(QScreen *screen,
-+                                        uint32_t idx, uint32_t fbId)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return(gbmScreen->queueOverlayPlane(idx, fbId));
-+    }
-+    return -1;
-+}
-+
-+int QEglFSKmsGbmIntegration::startDispPlane(QScreen *screen)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+        return(gbmScreen->startDispOverlayPlane());
-+    }
-+    return -1;
-+}
-+
-+int QEglFSKmsGbmIntegration::userCallBackHandle(QScreen *screen,  void (*hndlUserCallBack)(void *), void *userData)
-+{
-+    if(device())
-+    {
-+        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
-+		gbmScreen->m_hndl_user_callback = hndlUserCallBack;
-+		gbmScreen->m_user_data = userData;
-+        return 0;
++    if(res == NULL){
++        qWarning() << "plane resources not found\n";
++        return -1;
 +    }
-+    return -1;
-+}
-+
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-index 727571d3e3..86cf16c6f5 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-@@ -45,7 +45,6 @@
- #include "qeglfskmsintegration.h"
- #include <QtCore/QMap>
- #include <QtCore/QVariant>
--
- QT_BEGIN_NAMESPACE
- 
- class QEglFSKmsDevice;
-@@ -63,6 +62,19 @@ public:
- 
-     QPlatformCursor *createCursor(QPlatformScreen *screen) const Q_DECL_OVERRIDE;
-     void presentBuffer(QPlatformSurface *surface) Q_DECL_OVERRIDE;
-+    int exportBuffer(const QScreen *screen, uint32_t width,
-+        uint32_t height, uint32_t pixel_format,	uint32_t *strides,
-+        uint32_t *offsets, uint32_t buf_fd, uint32_t *buf_id) Q_DECL_OVERRIDE;
-+    int distroyBuffer(const QScreen *screen,uint32_t buf_id) Q_DECL_OVERRIDE;
-+    int setPlaneProperties(const QScreen *screen, uint8_t planeType,
-+        uint8_t idx, uint8_t numProp, const char **propName, uint32_t *propVal) Q_DECL_OVERRIDE;
-+    int getPlaneProperty(const QScreen *screen, uint8_t planeType,
-+        uint8_t idx, const char *propName) Q_DECL_OVERRIDE;
-+    int createPlane(const QScreen *screen) Q_DECL_OVERRIDE;
-+    int distroyPlane(const QScreen *screen, int planeId) Q_DECL_OVERRIDE;
-+    int queuePlane(QScreen *screen, uint32_t idx, uint32_t fbId) Q_DECL_OVERRIDE;
-+    int startDispPlane(QScreen *screen) Q_DECL_OVERRIDE;
-+    int userCallBackHandle(QScreen *screen, void (*fnPtr)(void *), void *data) Q_DECL_OVERRIDE;
- 
- protected:
-     QEglFSKmsDevice *createDevice(const QString &devicePath) Q_DECL_OVERRIDE;
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-index 7a17b60a5e..25ed63f4a8 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-@@ -49,10 +49,26 @@
- #include <QtGui/private/qguiapplication_p.h>
- #include <QtPlatformSupport/private/qfbvthandler_p.h>
- 
-+#include <QMutex>
-+#include <string.h>
-+
- QT_BEGIN_NAMESPACE
- 
- Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
- 
-+class DrmPageFlip : public QThread
-+{
-+
-+public:
-+    DrmPageFlip(QEglFSKmsGbmScreen *screen)
-+        : m_abort(false), m_gbm_screen(screen) {}
-+    bool m_abort;
-+    void run();
-+
-+private:
-+    QEglFSKmsGbmScreen *m_gbm_screen;
-+};
-+
- void QEglFSKmsGbmScreen::bufferDestroyedHandler(gbm_bo *bo, void *data)
- {
-     FrameBuffer *fb = static_cast<FrameBuffer *>(data);
-@@ -97,15 +113,118 @@ QEglFSKmsGbmScreen::QEglFSKmsGbmScreen(QEglFSKmsIntegration *integration,
-                                  QEglFSKmsOutput output,
-                                  QPoint position)
-     : QEglFSKmsScreen(integration, device, output, position)
-+    , m_qpa_flip_call(false)
-+    , m_user_flip_call(false)
-+	, m_start_flip_overlay_plane(false)
-     , m_gbm_surface(Q_NULLPTR)
-     , m_gbm_bo_current(Q_NULLPTR)
-     , m_gbm_bo_next(Q_NULLPTR)
-     , m_cursor(Q_NULLPTR)
-+    , m_flip_primary_plane(false)
-+    , m_plane_id{0}
-+    , m_plane_idx(0)
-+    , m_primary_plane_fb(0)
- {
-+    m_drm_page_flip = new DrmPageFlip(this);
-+    m_drm_page_flip->start();
- }
- 
- QEglFSKmsGbmScreen::~QEglFSKmsGbmScreen()
- {
-+    m_drm_page_flip->m_abort = true;
-+    m_drm_page_flip->wait();
-+    delete m_drm_page_flip;
-+    m_drm_page_flip = 0;
-+}
-+
-+/* This thread periodically cheks if there is any user submitted buffer for 
-+overlay with primary plane or if QT has drawn new surface (primary plane)
-+to be displayed. In any or both of the case, this thread will do atomic 
-+submission of the new framebuffer id to the DRM device for display.
-+Access to overlay plane queue and primary plane resources are Mutex protected
-+with respective threads. 
-+*/
-+void DrmPageFlip::run(){
-+    while(m_abort == false){
-+        drmModeAtomicReqPtr req = drmModeAtomicAlloc();
-+        bool commit_overlay_plane = false;
-+        bool commit_primary_plane = false;
-+        uint32_t primary_plane_fb_id;
-+        int ret = -1;
-+
-+        m_gbm_screen->m_primary_mutex.lock();
-+        commit_primary_plane = m_gbm_screen->m_flip_primary_plane;
-+        primary_plane_fb_id = m_gbm_screen->m_primary_plane_fb; 
-+        m_gbm_screen->m_flip_primary_plane = false;
-+        m_gbm_screen->m_primary_mutex.unlock();
 +
-+        if(commit_primary_plane == true){
-+            if((ret = drmModeAtomicAddProperty(req, m_gbm_screen->m_output.primary_plane_id,
-+                m_gbm_screen->device()->m_prop_fbId, primary_plane_fb_id)) < 0){
-+                    qWarning("failed to add property with error code = %d\n", ret);
-+            }
-+        }
++    for (i = 0; i < res->count_planes; i++) {
++        uint32_t planeId = res->planes[i];
++        unsigned int typeVal;
 +
-+        //Check for any new buffer queued by user application
-+        if(m_gbm_screen->m_start_flip_overlay_plane == true){
-+            m_gbm_screen->m_overlay_mutex.lock();
-+            for(uint32_t i = 0 ; i < m_gbm_screen->m_plane_idx; i++){
-+                if (!m_gbm_screen->overlayPlaneFbIdQueue[i].isEmpty()){
-+                    uint32_t planeId = m_gbm_screen->m_plane_id[i];
-+                    uint32_t fbId = m_gbm_screen->overlayPlaneFbIdQueue[i].dequeue();
-+                    if((ret = drmModeAtomicAddProperty(req, planeId, m_gbm_screen->device()->m_prop_fbId, fbId)) < 0){
-+                        qWarning("failed to add property with error code = %d\n", ret);
-+                    }
-+                    commit_overlay_plane = true;
-+                }
-+            }
-+            m_gbm_screen->m_overlay_mutex.unlock();
++        drmModePlane *plane = drmModeGetPlane(m_dri_fd, planeId);
++        if(plane == NULL){
++            qWarning() << "getPlane: Plane not found";
++            goto error_exit;
 +        }
 +
-+        if((commit_primary_plane == true) ||  (commit_overlay_plane == true)){            
-+            ret = drmModeAtomicCommit(m_gbm_screen->device()->fd(), req,
-+                DRM_MODE_ATOMIC_TEST_ONLY, 0);
++        props = drmModeObjectGetProperties(m_dri_fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
 +
-+            if(!ret){
-+                if(commit_overlay_plane == true){
-+                    m_gbm_screen->m_user_flip_call = true;
-+                }
++        if(props == NULL){
++            qWarning() << "getPlane: plane (%d) properties not found\n" << plane->plane_id;
++            drmModeFreePlane(plane);
++            goto error_exit;
++        }
 +
-+                if(commit_primary_plane == true){
-+                    m_gbm_screen->m_qpa_flip_call = true;
-+                }                
++        typeVal = getPlaneProperty(DRM_MODE_OBJECT_PLANE, plane->plane_id, "type");
 +
-+                drmModeAtomicCommit(m_gbm_screen->device()->fd(), req,
-+                    DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, m_gbm_screen);
++        drmModeFreeObjectProperties(props);
++        drmModeFreePlane(plane);
 +
-+                //sleeping for 5 msec, assuming that display is not running at more than 120 fps
-+                msleep(5);
-+                while(m_gbm_screen->m_flip_event.tryAcquire(1) == false){
-+                    usleep(500);
++        if(typeVal == planeType){
++            if(planeType == DRM_PLANE_TYPE_PRIMARY){
++                if((plane->crtc_id == crtc_id) || (!plane->crtc_id)){
++                    plane->crtc_id = crtc_id;
++                    drmModeFreePlaneResources(res);
++                    return planeId;
 +                }
-+                m_gbm_screen->m_qpa_flip_call = false;
-+                m_gbm_screen->m_user_flip_call = false;
-+
-+                msleep(1);
 +            }
-+            else {
-+                if(m_gbm_screen->m_qpa_flip_call == true){
-+                    qErrnoWarning("Could not queue DRM page flip!");
-+                    gbm_surface_release_buffer(m_gbm_screen->m_gbm_surface, m_gbm_screen->m_gbm_bo_next);
-+                    m_gbm_screen->m_gbm_bo_next = Q_NULLPTR;
-+                }
-+
-+                if(commit_overlay_plane == true){
-+                    qErrnoWarning("Could not page flip user overlay plane!");
-+                    m_gbm_screen->m_hndl_user_callback(m_gbm_screen->m_user_data);
-+                }
++            else if (!(m_plane_allocator & ((quint64)1<<planeId))){
++                m_plane_allocator |= ((quint64)1 << planeId);
++                drmModeFreePlaneResources(res);
++                return planeId;
 +            }
 +        }
-+        else{
-+            msleep(1);
-+        }
-+        drmModeAtomicFree(req);
 +    }
- }
- 
- QPlatformCursor *QEglFSKmsGbmScreen::cursor() const
-@@ -159,12 +278,15 @@ void QEglFSKmsGbmScreen::destroySurface()
- void QEglFSKmsGbmScreen::waitForFlip()
- {
-     // Don't lock the mutex unless we actually need to
 +
-     if (!m_gbm_bo_next)
-         return;
- 
-     QMutexLocker lock(&m_waitForFlipMutex);
--    while (m_gbm_bo_next)
--        static_cast<QEglFSKmsGbmDevice *>(device())->handleDrmEvent();
-+    while (m_gbm_bo_next){
-+        usleep(200);
-+    }
++    qWarning("getPlane: Plane for crtc %d not found", crtc_id);
++error_exit:
++    drmModeFreePlaneResources(res);
++    return -1;
++}
 +
- }
- 
- void QEglFSKmsGbmScreen::flip()
-@@ -175,6 +297,7 @@ void QEglFSKmsGbmScreen::flip()
-     }
+ int QKmsDevice::crtcForConnector(drmModeResPtr resources, drmModeConnectorPtr connector)
+ {
+     for (int i = 0; i < connector->count_encoders; i++) {
+@@ -175,6 +348,7 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+     OutputConfiguration configuration;
+     QSize configurationSize;
+     drmModeModeInfo configurationModeline;
++    int primary_plane_id;
  
-     m_gbm_bo_next = gbm_surface_lock_front_buffer(m_gbm_surface);
-+
-     if (!m_gbm_bo_next) {
-         qWarning("Could not lock GBM surface front buffer!");
-         return;
-@@ -191,23 +314,18 @@ void QEglFSKmsGbmScreen::flip()
-                                  &output().modes[output().mode]);
+     auto userConfig = m_screenConfig->outputSettings();
+     auto userConnectorConfig = userConfig.value(QString::fromUtf8(connectorName));
+@@ -286,14 +460,14 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
  
-         if (ret) {
--            qErrnoWarning("Could not set DRM mode!");
-+            qErrnoWarning("Could not set DRM (%d) CRTC (%d) mode!", device()->fd(), output().crtc_id);
-+
-         } else {
-             output().mode_set = true;
-             setPowerState(PowerStateOn);
-         }
-     }
+     int selected_mode = -1;
  
--    int ret = drmModePageFlip(device()->fd(),
--                              output().crtc_id,
--                              fb->fb,
--                              DRM_MODE_PAGE_FLIP_EVENT,
--                              this);
--    if (ret) {
--        qErrnoWarning("Could not queue DRM page flip!");
--        gbm_surface_release_buffer(m_gbm_surface, m_gbm_bo_next);
--        m_gbm_bo_next = Q_NULLPTR;
--    }
-+    m_primary_mutex.lock();
-+    m_primary_plane_fb = fb->fb;
-+    m_flip_primary_plane = true;
-+    m_primary_mutex.unlock();
- }
+-    if (configured >= 0)
+-        selected_mode = configured;
++    if (current >= 0)
++        selected_mode = current;
+     else if (preferred >= 0)
+         selected_mode = preferred;
+-    else if (current >= 0)
+-        selected_mode = current;
+     else if (best >= 0)
+         selected_mode = best;
++    else if (configured >= 0)
++        selected_mode = configured;
  
- void QEglFSKmsGbmScreen::flipFinished()
-@@ -220,4 +338,132 @@ void QEglFSKmsGbmScreen::flipFinished()
-     m_gbm_bo_next = Q_NULLPTR;
- }
+     if (selected_mode < 0) {
+         qWarning() << "No modes available for output" << connectorName;
+@@ -306,6 +480,12 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+                                   << '@' << refresh << "hz for output" << connectorName;
+     }
  
-+int QEglFSKmsGbmScreen::addOverlayBuffer(uint32_t width, 
-+                                         uint32_t height,
-+                                         uint32_t pixel_format,
-+                                         uint32_t *strides,
-+                                         uint32_t *offsets,
-+                                         uint32_t buf_fd,
-+                                         uint32_t *buf_id)
-+{
-+    /* Get the buffer handle from the exported buffer fd */
-+    uint32_t bo_handle;
-+    drmPrimeFDToHandle(m_device->fd(), buf_fd, &bo_handle);
-+    int ret = drmModeAddFB2(m_device->fd(), width, height, pixel_format, &bo_handle,\
-+        strides, offsets, buf_id, 0);
-+
-+    if (ret) {
-+		qWarning() << "addOverlayBuffer: drmModeAddFB2 failed:" << strerror(errno) << ret;
-+        return -1;
-+    }
-+    return ret;
-+}
-+
-+int QEglFSKmsGbmScreen::removeOverlayBuffer(uint32_t buf_id)
-+{
-+    int ret = drmModeRmFB(m_device->fd(), buf_id);
-+
-+    if (ret) {
-+		qWarning() << "removeOverlayBuffer: drmModeRmFB failed:" << strerror(errno) << ret;
-+        return -1;
-+    }
-+    return ret;
-+}
-+
-+int QEglFSKmsGbmScreen::setPlaneProperties(uint8_t planeType, uint8_t idx,
-+                                           uint8_t numProp, const char **propName, uint32_t *propVal)
-+{
-+    uint32_t planeId, crtcId;
-+    uint32_t objectType;
-+    crtcId = m_output.crtc_id;
-+    
-+	if (idx > MAX_NUM_PLANES){
-+		qWarning("queueOverlayPlane: invalid plane index\n");
-+		return -1;
-+    }
-+
-+    if(planeType == DRM_PLANE_TYPE_OVERLAY){
-+        planeId = m_plane_id[idx];
-+        objectType = DRM_MODE_OBJECT_PLANE;
-+    }
-+    else if(planeType == DRM_PLANE_TYPE_PRIMARY){
-+        objectType = DRM_MODE_OBJECT_CRTC;
-+        planeId = crtcId;
-+    }
-+    else{
-+		qWarning() << "setPlaneProperties: invalid plane type";
-+        return -1;
-+    }
-+    return m_device->setPlaneProperties(objectType, crtcId, planeId, numProp, propName, propVal);
-+}
++    primary_plane_id = getPlane(crtc_id, DRM_PLANE_TYPE_PRIMARY);
 +
-+int QEglFSKmsGbmScreen::getPlaneProperty(uint8_t planeType, uint8_t idx, const char *propName)
-+{
-+    uint32_t planeId, crtcId;
-+    uint32_t objectType;
-+    crtcId = m_output.crtc_id;
-+    
-+	if (idx > MAX_NUM_PLANES){
-+		qWarning("queueOverlayPlane: invalid plane index\n");
-+		return -1;
-+    }
-+
-+    if(planeType == DRM_PLANE_TYPE_OVERLAY){
-+        planeId = m_plane_id[idx];
-+        objectType = DRM_MODE_OBJECT_PLANE;
-+    }
-+    else if(planeType == DRM_PLANE_TYPE_PRIMARY){
-+        objectType = DRM_MODE_OBJECT_CRTC;
-+        planeId = crtcId;
-+    }
-+    else{
-+		qWarning() << "getPlaneProperty: invalid plane type";
-+        return -1;
++    if(primary_plane_id < 0){
++        return Q_NULLPTR;
 +    }
-+    return m_device->getPlaneProperty(objectType, planeId, propName);
-+}
 +
-+int QEglFSKmsGbmScreen::createOverlayPlane()
-+{
-+    int planeId = m_device->getPlane(0, DRM_PLANE_TYPE_OVERLAY);
-+    if (planeId > 0){
-+        uint8_t pcnt = m_plane_idx++;
-+        if(pcnt > MAX_NUM_PLANES){
-+			qWarning() << "createOverlayPlane: Don't support number of planes greater then" <<  MAX_NUM_PLANES;
-+        }
-+        m_plane_id[pcnt] = planeId;
-+        return pcnt;
-+    }
-+    else {
-+        qWarning() << "createOverlayPlane: cannot find free plane";
-+        return -1;
+     // physical size from connector < config values < env vars
+     int pwidth = qEnvironmentVariableIntValue("QT_QPA_EGLFS_PHYSICAL_WIDTH");
+     if (!pwidth)
+@@ -337,7 +517,8 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+         connectorProperty(connector, QByteArrayLiteral("DPMS")),
+         false,
+         0,
+-        false
++        false,
++        primary_plane_id
+     };
+ 
+     bool ok;
+@@ -363,6 +544,19 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+     m_crtc_allocator |= (1 << output.crtc_id);
+     m_connector_allocator |= (1 << output.connector_id);
+ 
++    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, primary_plane_id,
++        DRM_MODE_OBJECT_PLANE);
++    if(props == NULL){
++		qWarning() << "drm object properties for planeId:" << primary_plane_id << "is NULL";
++        return NULL;
 +    }
-+}
-+
-+int QEglFSKmsGbmScreen::distroyOverlayPlane(int pcnt)
-+{
-+    int planeId = m_plane_id[pcnt];
-+    Q_UNUSED(planeId);
-+    //nothing to be done to distroy the plane
-+    return 0;
-+}
 +
-+int QEglFSKmsGbmScreen::queueOverlayPlane(uint32_t idx, uint32_t fbId)
-+{
-+    if (idx > MAX_NUM_PLANES){
-+        qWarning("queueOverlayPlane: invalid plane index\n");
-+        return -1;
++    if(getDrmPropId(props, "FB_ID", &m_prop_fbId) < 0){
++        drmModeFreeObjectProperties(props);
++        qWarning() << "Couldn't get DRM property id for FB_ID";
++        return NULL;
 +    }
-+    m_overlay_mutex.lock();
-+    overlayPlaneFbIdQueue[idx].enqueue(fbId);
-+    m_overlay_mutex.unlock();
-+    return 0;
-+}
-+
-+int QEglFSKmsGbmScreen::startDispOverlayPlane()
-+{
-+    m_start_flip_overlay_plane = true;
-+    return 0;
-+}
-+
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
-index 3381bbfdbb..d2915c40a7 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
-@@ -44,12 +44,15 @@
- 
- #include "qeglfskmsscreen.h"
- #include <QtCore/QMutex>
-+#include <QtCore/QSemaphore>
-+#include <QtCore/QQueue>
- 
- #include <gbm.h>
--
- QT_BEGIN_NAMESPACE
++    drmModeFreeObjectProperties(props);
+     return createScreen(output);
+ }
  
- class QEglFSKmsGbmCursor;
-+class DrmPageFlip;
-+typedef void (*m_fnptr_user_callback)(void *data);
+@@ -383,11 +577,13 @@ drmModePropertyPtr QKmsDevice::connectorProperty(drmModeConnectorPtr connector,
+ }
  
- class QEglFSKmsGbmScreen : public QEglFSKmsScreen
+ QKmsDevice::QKmsDevice(QKmsScreenConfig *screenConfig, const QString &path)
+-    : m_screenConfig(screenConfig)
++    : m_prop_fbId(0)
++    , m_screenConfig(screenConfig)
+     , m_path(path)
+     , m_dri_fd(-1)
+     , m_crtc_allocator(0)
+     , m_connector_allocator(0)
++    , m_plane_allocator(0)
  {
-@@ -70,6 +73,30 @@ public:
-     void flip() Q_DECL_OVERRIDE;
-     void flipFinished() Q_DECL_OVERRIDE;
+     if (m_path.isEmpty()) {
+         m_path = m_screenConfig->devicePath();
+diff --git a/src/platformsupport/kmsconvenience/qkmsdevice_p.h b/src/platformsupport/kmsconvenience/qkmsdevice_p.h
+index 35a51c1..e645157 100644
+--- a/src/platformsupport/kmsconvenience/qkmsdevice_p.h
++++ b/src/platformsupport/kmsconvenience/qkmsdevice_p.h
+@@ -109,6 +109,7 @@ struct QKmsOutput
+     bool wants_plane;
+     uint32_t plane_id;
+     bool plane_set;
++    uint32_t primary_plane_id;
  
-+    int addOverlayBuffer(uint32_t width,
-+        uint32_t height,
-+        uint32_t pixel_format,
-+        uint32_t *strides,
-+        uint32_t *offsets,
-+        uint32_t buf_fd,
-+        uint32_t *buf_id);
-+    int removeOverlayBuffer(uint32_t buf_id);
-+    int setPlaneProperties(uint8_t planeType, uint8_t idx,
+     void restoreMode(QKmsDevice *device);
+     void cleanup(QKmsDevice *device);
+@@ -139,6 +140,12 @@ public:
+     QString devicePath() const;
+ 
+     QKmsScreenConfig *screenConfig() const;
++    int setPlaneProperties(uint32_t objectType, uint32_t crtcId, uint32_t planeId,
 +        uint8_t numProp, const char **propName, uint32_t *propVal);
-+    int getPlaneProperty(uint8_t planeType, uint8_t idx, const char *propName);
-+    int createOverlayPlane();
-+    int distroyOverlayPlane(int pcnt);
-+    int queueOverlayPlane(uint32_t idx, uint32_t fbId);
-+    int startDispOverlayPlane();
-+    m_fnptr_user_callback m_hndl_user_callback;
-+    void *m_user_data;
-+    bool m_qpa_flip_call;
-+    bool m_user_flip_call;
-+    bool m_start_flip_overlay_plane;
-+    QMutex m_flip_mutex;
-+    QSemaphore m_flip_event;
-+    friend class DrmPageFlip;
-+
- private:
-     gbm_surface *m_gbm_surface;
++    int getPlaneProperty(uint32_t objectType, uint32_t planeId,
++        const char *propName);
++    int getPlane(uint32_t crtcId, uint8_t planeType);
++    uint32_t m_prop_fbId;
  
-@@ -86,6 +113,15 @@ private:
-     FrameBuffer *framebufferForBufferObject(gbm_bo *bo);
+ protected:
+     virtual QPlatformScreen *createScreen(const QKmsOutput &output) = 0;
+@@ -158,10 +165,13 @@ protected:
+     QString m_path;
+     int m_dri_fd;
  
-     static QMutex m_waitForFlipMutex;
-+
-+    bool m_flip_primary_plane;
-+    QMutex m_overlay_mutex;
-+    QMutex m_primary_mutex;
-+    QQueue<uint32_t> overlayPlaneFbIdQueue[MAX_NUM_PLANES];
-+    uint32_t m_plane_id[MAX_NUM_PLANES];
-+    uint8_t m_plane_idx;
-+    uint32_t m_primary_plane_fb;
-+    DrmPageFlip *m_drm_page_flip;
- };
+-    quint32 m_crtc_allocator;
+-    quint32 m_connector_allocator;
++    quint64 m_crtc_allocator;
++    quint64 m_connector_allocator;
++    quint64 m_plane_allocator;
  
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp
-index f4ffee569d..6dbe84202b 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp
-@@ -62,6 +62,180 @@ enum OutputConfiguration {
-     OutputConfigModeline
+ private:
++    int getDrmPropId(drmModeObjectPropertiesPtr props,
++        const char *name, unsigned int *propId);
+     Q_DISABLE_COPY(QKmsDevice)
  };
  
-+
-+int QEglFSKmsDevice::getDrmPropId(drmModeObjectPropertiesPtr props,
-+                                  const char *name, uint32_t *propId)
+diff --git a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp
+index e411ea5..1722d74 100644
+--- a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp
++++ b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp
+@@ -374,4 +374,91 @@ EGLConfig QEglFSDeviceIntegration::chooseConfig(EGLDisplay display, const QSurfa
+     return chooser.chooseConfig();
+ }
+ 
++int QEglFSDeviceIntegration::exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
++                                        uint32_t pixel_format, uint32_t *strides, uint32_t *offsets,
++                                        uint32_t buf_fd, uint32_t *bufId)
 +{
-+    drmModePropertyPtr p;
-+    unsigned int i;
-+    *propId = 0;/* Property ID should always be > 0 */
-+
-+    for (i = 0; i < props->count_props; i++) {
-+        p = drmModeGetProperty(m_dri_fd, props->props[i]);
-+        if (!strcmp(p->name, name)){
-+            *propId = p->prop_id;
-+            break;
-+        }
-+        drmModeFreeProperty(p);
-+    }
-+    if (!*propId) {
-+        qWarning() << "getDrmPropId: Could not find" <<  name << "property";
-+        return(-1);
-+    }
++    Q_UNUSED(screen);
++    Q_UNUSED(width);
++    Q_UNUSED(height);
++    Q_UNUSED(pixel_format);
++    Q_UNUSED(strides);
++    Q_UNUSED(offsets);
++    Q_UNUSED(buf_fd);
++    Q_UNUSED(bufId);
 +
-+    return i;
++    return -1;
 +}
 +
-+int QEglFSKmsDevice::setPlaneProperties(uint32_t objectType, uint32_t crtcId, 
-+                                        uint32_t planeId, uint8_t num_prop, const char **propName,
-+                                        uint32_t *propVal)
++int QEglFSDeviceIntegration::distroyBuffer(const QScreen *screen, uint32_t bufId)
 +{
-+    int ret, i;
-+    uint32_t objectId;
-+    if(objectType == DRM_MODE_OBJECT_PLANE){
-+        objectId = planeId;
-+    }
-+    else{
-+        objectId = crtcId;
-+    }
-+    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, objectId,
-+        objectType);
-+
-+    if(props == NULL){
-+        qWarning() << "setPlaneProperties: drm object properties for objectId" << objectId << "is NULL";
-+        return (-1);
-+    }
-+
-+    drmModeAtomicReqPtr req = drmModeAtomicAlloc();
-+    uint32_t propId;
-+
-+    for(i = 0; i < num_prop; i++)
-+    {
-+        if (getDrmPropId(props, propName[i], &propId) < 0){
-+            qWarning() << "setPlaneProperties: failed to get the DRM property id for " <<  propName[i];
-+            goto error_exit;
-+        }
-+        if(drmModeAtomicAddProperty(req, objectId, propId, propVal[i]) < 0){
-+            qWarning() << "setPlaneProperties: failed to add DRM property for" << propName[i];
-+            goto error_exit;
-+        }
-+    }
++    Q_UNUSED(screen)
++        Q_UNUSED(bufId);
 +
-+    if(objectType == DRM_MODE_OBJECT_PLANE){
-+        if(getDrmPropId(props, "CRTC_ID", &propId) < 0){
-+            qWarning() << "setPlaneProperties: failed to get the DRM property id for CRTC_ID";
-+            goto error_exit;
-+        }
-+        if(drmModeAtomicAddProperty(req, planeId, propId, crtcId) < 0){
-+            qWarning() << "setPlaneProperties: failed to add DRM property for CRTC_ID";
-+            goto error_exit;
-+        }
-+    }
++    return -1;
++}
 +
-+    ret = drmModeAtomicCommit(m_dri_fd, req, DRM_MODE_ATOMIC_TEST_ONLY, 0);
++int QEglFSDeviceIntegration::setPlaneProperties(const QScreen *screen,
++                                              uint8_t planeType, uint8_t idx, uint8_t numProp,
++                                              const char **propName, uint32_t *propVal)
++{
++    Q_UNUSED(screen);
++    Q_UNUSED(planeType);
++    Q_UNUSED(idx);
++    Q_UNUSED(numProp);
++    Q_UNUSED(propName);
++    Q_UNUSED(propVal);
 +
-+    if(!ret){
-+        drmModeAtomicCommit(m_dri_fd, req, 0, 0);
-+    }
-+    else{
-+        qWarning() << "setPlaneProperties: ret from drmModeAtomicCommit = " <<  ret;
-+        goto error_exit;
-+    }
++    return -1;
++}
 +
-+    drmModeAtomicFree(req);
-+    drmModeFreeObjectProperties(props);
-+    return 0;
++int QEglFSDeviceIntegration::getPlaneProperty(const QScreen *screen,
++                                            uint8_t planeType, uint8_t idx,
++                                            const char *propName)
++{
++    Q_UNUSED(screen);
++    Q_UNUSED(planeType);
++    Q_UNUSED(idx);
++    Q_UNUSED(propName);
 +
-+error_exit:
-+    drmModeAtomicFree(req);
-+    drmModeFreeObjectProperties(props);
 +    return -1;
 +}
 +
-+int QEglFSKmsDevice::getPlaneProperty(uint32_t objectType, uint32_t planeId, 
-+                                      const char *propName)
++int QEglFSDeviceIntegration::createPlane(const QScreen *screen)
 +{
-+    uint32_t propId;
-+    int propVal = -1, propIndx;
-+
-+    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, planeId,
-+        objectType);
++    Q_UNUSED(screen);
++    return -1;
++}
 +
-+    if(props == NULL){
-+        qWarning() << "getPlaneProperty: drm obeject properties for plane type is NULL\n";
-+        return (-1);
-+    }
++int QEglFSDeviceIntegration::distroyPlane(const QScreen *screen, int planeId)
++{
++    Q_UNUSED(screen);
++    Q_UNUSED(planeId);
++    return -1;
++}
 +
-+    propIndx = getDrmPropId(props, propName, &propId);
++int QEglFSDeviceIntegration::queuePlane(QScreen *screen,
++                                      uint32_t idx, uint32_t fbId)
++{
++    Q_UNUSED(screen);
++    Q_UNUSED(idx);
++    Q_UNUSED(fbId);
 +
-+    if(propIndx >= 0){
-+        propVal = props->prop_values[propIndx];
-+    }
-+    else{
-+        qWarning() << "getPlaneProperty: Couldn't get DRM plane property for" << *propName;
-+        return -1;
-+    }
-+    drmModeFreeObjectProperties(props);
++    return -1;
++}
 +
-+    return propVal;
++int QEglFSDeviceIntegration::startDispPlane(QScreen *screen)
++{
++    Q_UNUSED(screen);
++	return -1;
 +}
 +
-+int QEglFSKmsDevice::getPlane(uint32_t crtc_id, uint8_t planeType)
++int QEglFSDeviceIntegration::userCallBackHandle(QScreen *screen, void (*fnPtr)(void *), void *data)
 +{
-+    uint32_t i;
-+    drmModeObjectProperties *props;
-+    drmModePlaneRes *res = drmModeGetPlaneResources(m_dri_fd);
++    Q_UNUSED(screen);
++    Q_UNUSED(fnPtr);
++    Q_UNUSED(data);
++    return -1;
++}
 +
-+    if(res == NULL){
-+        qWarning() << "plane resources not found\n";
-+        return -1;
-+    }
+ QT_END_NAMESPACE
+diff --git a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h
+index 4335554..b3d8fa0 100644
+--- a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h
++++ b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h
+@@ -107,6 +107,20 @@ public:
+     virtual void *wlDisplay() const;
+ 
+     static EGLConfig chooseConfig(EGLDisplay display, const QSurfaceFormat &format);
++    virtual int exportBuffer(const QScreen *screen, uint32_t width,
++        uint32_t height, uint32_t pixel_format, uint32_t *strides,
++        uint32_t *offsets, uint32_t buf_fd, uint32_t *buf_id);
++    virtual int distroyBuffer(const QScreen *screen, uint32_t buf_id);
++    virtual int setPlaneProperties(const QScreen *screen, uint8_t planeType,
++        uint8_t idx, uint8_t numProp, const char **propName,
++        uint32_t *propVal);
++    virtual int getPlaneProperty(const QScreen *screen, uint8_t planeType,
++        uint8_t idx, const char *propName);
++    virtual int createPlane(const QScreen *screen);
++    virtual int distroyPlane(const QScreen *screen, int plane_id);
++    virtual int queuePlane(QScreen *screen, uint32_t idx, uint32_t fb_id);
++    virtual int startDispPlane(QScreen *screen);
++    virtual int userCallBackHandle(QScreen *screen, void (*fnPtr)(void *), void *data);
+ };
+ 
+ class Q_EGLFS_EXPORT QEglFSDeviceIntegrationPlugin : public QObject
+diff --git a/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
+index 9a0be48..3bc4111 100644
+--- a/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
++++ b/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
+@@ -286,8 +286,17 @@ enum ResourceType {
+     EglConfig,
+     NativeDisplay,
+     XlibDisplay,
+-    WaylandDisplay,
+-    EglSurface
++    WaylandDisplay,
++    EglSurface,
++    ExportBuffer,
++    DistroyBuffer,
++    SetPlaneProperties,
++    GetPlaneProperty,
++    CreatePlane,
++    DistroyPlane,
++    QueuePlane,
++    StartDispPlane,
++    UserCallBackHandl,
+ };
+ 
+ static int resourceType(const QByteArray &key)
+@@ -300,7 +309,16 @@ static int resourceType(const QByteArray &key)
+         QByteArrayLiteral("nativedisplay"),
+         QByteArrayLiteral("display"),
+         QByteArrayLiteral("server_wl_display"),
+-        QByteArrayLiteral("eglsurface")
++        QByteArrayLiteral("eglsurface"),
++        QByteArrayLiteral("export_buffer"),
++        QByteArrayLiteral("distroy_buffer"),
++        QByteArrayLiteral("set_plane_properties"),
++        QByteArrayLiteral("get_plane_property"),
++        QByteArrayLiteral("create_plane"),
++        QByteArrayLiteral("distroy_plane"),
++        QByteArrayLiteral("queue_plane"),
++        QByteArrayLiteral("start_disp_plane"),
++        QByteArrayLiteral("user_call_back_handle"),
+     };
+     const QByteArray *end = names + sizeof(names) / sizeof(names[0]);
+     const QByteArray *result = std::find(names, end, key);
+@@ -309,6 +327,61 @@ static int resourceType(const QByteArray &key)
+     return int(result - names);
+ }
+ 
++static int exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
++                        uint32_t pixel_format, uint32_t *strides, uint32_t *offsets,
++                        uint32_t buf_fd, uint32_t *buf_id)
++{
++    return(qt_egl_device_integration()->exportBuffer(screen, width,
++        height, pixel_format, strides, offsets, buf_fd, buf_id));
++}
 +
-+    for (i = 0; i < res->count_planes; i++) {
-+        uint32_t planeId = res->planes[i];
-+        unsigned int typeVal;
++static int distroyBuffer(const QScreen *screen, uint32_t buf_id)
++{
++    return(qt_egl_device_integration()->distroyBuffer(screen, buf_id));
++}
 +
-+        drmModePlane *plane = drmModeGetPlane(m_dri_fd, planeId);
-+        if(plane == NULL){
-+            qWarning() << "getPlane: Plane not found";
-+            goto error_exit;
-+        }
++static int setPlaneProperties(const QScreen *screen, uint8_t planeType,
++                              uint32_t idx, uint8_t num_prop, const char **prop_name, uint32_t *prop_val)
++{
++    return (qt_egl_device_integration()->setPlaneProperties(
++        screen, planeType, idx, num_prop, prop_name, prop_val));
++}
 +
-+        props = drmModeObjectGetProperties(m_dri_fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
++static int getPlaneProperty(const QScreen *screen, uint8_t planeType, uint32_t idx,
++                            const char *propName)
++{
++    return (qt_egl_device_integration()->getPlaneProperty(
++        screen, planeType, idx, propName));
++}
 +
-+        if(props == NULL){
-+            qWarning() << "getPlane: plane (%d) properties not found\n" << plane->plane_id;
-+            drmModeFreePlane(plane);
-+            goto error_exit;
-+        }
++static int createPlane(QScreen *screen)
++{
++    return(qt_egl_device_integration()->createPlane(screen));
++}
 +
-+        typeVal = getPlaneProperty(DRM_MODE_OBJECT_PLANE, plane->plane_id, "type");
++static int distroyPlane(QScreen *screen, int plane_id)
++{
++    return (qt_egl_device_integration()->distroyPlane(screen, plane_id));
++}
 +
-+        drmModeFreeObjectProperties(props);
-+        drmModeFreePlane(plane);
++static int queuePlane(QScreen *screen,
++                      uint32_t idx, uint32_t fb_id)
++{
++    return (qt_egl_device_integration()->queuePlane(screen,
++        idx, fb_id));
++}
 +
-+        if(typeVal == planeType){
-+            if(planeType == DRM_PLANE_TYPE_PRIMARY){
-+                if((plane->crtc_id == crtc_id) || (!plane->crtc_id)){
-+                    plane->crtc_id = crtc_id;
-+                    drmModeFreePlaneResources(res);
-+                    return planeId;
-+                }
-+            }
-+            else if (!(m_plane_allocator & ((quint64)1<<planeId))){
-+                m_plane_allocator |= ((quint64)1 << planeId);
-+                drmModeFreePlaneResources(res);
-+                return planeId;
-+            }
-+        }
-+    }
++static int startDispPlane(QScreen *screen)
++{
++    return (qt_egl_device_integration()->startDispPlane(screen));
++}
 +
-+    qWarning("getPlane: Plane for crtc %d not found", crtc_id);
-+error_exit:
-+    drmModeFreePlaneResources(res);
-+    return -1;
++static int userCallBackHandle(QScreen *screen,  void (*funPtr)(void *), void *data)
++{
++    return (qt_egl_device_integration()->userCallBackHandle(screen,
++        funPtr, data));
 +}
 +
- int QEglFSKmsDevice::crtcForConnector(drmModeResPtr resources, drmModeConnectorPtr connector)
+ void *QEglFSIntegration::nativeResourceForIntegration(const QByteArray &resource)
  {
-     for (int i = 0; i < connector->count_encoders; i++) {
-@@ -159,6 +333,7 @@ static bool parseModeline(const QByteArray &text, drmModeModeInfoPtr mode)
-     return true;
- }
+     void *result = 0;
+@@ -323,6 +396,33 @@ void *QEglFSIntegration::nativeResourceForIntegration(const QByteArray &resource
+     case WaylandDisplay:
+         result = qt_egl_device_integration()->wlDisplay();
+         break;
++    case ExportBuffer:
++        result = reinterpret_cast<void *>(exportBuffer);
++        break;
++    case DistroyBuffer:
++        result = reinterpret_cast<void *>(distroyBuffer);
++        break;
++    case CreatePlane:
++        result = reinterpret_cast<void *>(createPlane);
++        break;
++    case DistroyPlane:
++        result = reinterpret_cast<void *>(distroyPlane);
++        break;
++    case SetPlaneProperties:
++        result = reinterpret_cast<void *>(setPlaneProperties);
++        break;
++    case GetPlaneProperty:
++        result = reinterpret_cast<void *>(getPlaneProperty);
++        break;
++    case QueuePlane:
++        result = reinterpret_cast<void *>(queuePlane);
++        break;
++    case StartDispPlane:
++        result = reinterpret_cast<void *>(startDispPlane);
++        break;
++    case UserCallBackHandl:
++        result = reinterpret_cast<void *>(userCallBackHandle);
++        break;
+     default:
+         break;
+     }
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
+index e218d58..9948ef7 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
+@@ -45,7 +45,8 @@
+ #include "qeglfsintegration_p.h"
  
-+
- QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, drmModeConnectorPtr connector, QPoint pos)
- {
-     const QByteArray connectorName = nameForConnector(connector);
-@@ -172,6 +347,7 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
-     OutputConfiguration configuration;
-     QSize configurationSize;
-     drmModeModeInfo configurationModeline;
-+    int plane_id;
+ #include <QtCore/QLoggingCategory>
+-#include <QtCore/private/qcore_unix_p.h>
++#include <QtCore/private/qcore_unix_p.h>
++#include <QThread>
  
-     const QByteArray mode = m_integration->outputSettings().value(QString::fromUtf8(connectorName))
-             .value(QStringLiteral("mode"), QStringLiteral("preferred")).toByteArray().toLower();
-@@ -268,14 +444,14 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
+ #define ARRAY_LENGTH(a) (sizeof (a) / sizeof (a)[0])
  
-     int selected_mode = -1;
+@@ -53,6 +54,31 @@ QT_BEGIN_NAMESPACE
  
--    if (configured >= 0)
--        selected_mode = configured;
-+    if (current >= 0)
-+        selected_mode = current;
-     else if (preferred >= 0)
-         selected_mode = preferred;
--    else if (current >= 0)
--        selected_mode = current;
-     else if (best >= 0)
-         selected_mode = best;
-+    else if (configured >= 0)
-+        selected_mode = configured;
+ Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
  
-     if (selected_mode < 0) {
-         qWarning() << "No modes available for output" << connectorName;
-@@ -287,6 +463,13 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
-         qCDebug(qLcEglfsKmsDebug) << "Selected mode" << selected_mode << ":" << width << "x" << height
-                                   << '@' << refresh << "hz for output" << connectorName;
-     }
-+    
-+    plane_id = getPlane(crtc_id, DRM_PLANE_TYPE_PRIMARY);
++class DrmPageFlipHandler : public QThread
++{
++public:
++    DrmPageFlipHandler(QEglFSKmsGbmDevice *gbm_device)
++        : m_abort(false), m_gbm_device(gbm_device)  {}
++    bool m_abort;
++    void run();
 +
-+    if(plane_id < 0){
-+        return Q_NULLPTR;
++private:
++    QEglFSKmsGbmDevice *m_gbm_device;
++};
++
++void DrmPageFlipHandler::run()
++{
++    drmEventContext drmEvent = {
++        DRM_EVENT_CONTEXT_VERSION,
++        Q_NULLPTR,      // vblank handler
++        QEglFSKmsGbmDevice::pageFlipHandler // page flip handler
++    };
++
++    while(m_abort == false){
++        drmHandleEvent(m_gbm_device->fd(), &drmEvent);
 +    }
++}
 +
-     static const int width = qEnvironmentVariableIntValue("QT_QPA_EGLFS_PHYSICAL_WIDTH");
-     static const int height = qEnvironmentVariableIntValue("QT_QPA_EGLFS_PHYSICAL_HEIGHT");
-     QSizeF size(width, height);
-@@ -304,12 +487,26 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
-         drmModeGetCrtc(m_dri_fd, crtc_id),
-         modes,
-         connector->subpixel,
--        connectorProperty(connector, QByteArrayLiteral("DPMS"))
-+        connectorProperty(connector, QByteArrayLiteral("DPMS")),
-+        plane_id
-     };
- 
-     m_crtc_allocator |= (1 << output.crtc_id);
-     m_connector_allocator |= (1 << output.connector_id);
+ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
+ {
+     Q_UNUSED(fd);
+@@ -60,8 +86,17 @@ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned
+     Q_UNUSED(tv_sec);
+     Q_UNUSED(tv_usec);
  
-+    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, plane_id,
-+        DRM_MODE_OBJECT_PLANE);
-+    if(props == NULL){
-+		qWarning() << "drm object properties for planeId:" << plane_id << "is NULL";
-+        return NULL;
+-    QEglFSKmsScreen *screen = static_cast<QEglFSKmsScreen *>(user_data);
+-    screen->flipFinished();
++    QEglFSKmsGbmScreen *screen = static_cast<QEglFSKmsGbmScreen *>(user_data);
++
++    if(screen->m_qpa_flip_call == true){
++        screen->flipFinished();
 +    }
 +
-+    if(getDrmPropId(props, "FB_ID", &m_prop_fbId) < 0){
-+        drmModeFreeObjectProperties(props);
-+        qWarning() << "Couldn't get DRM property id for FB_ID";
-+        return NULL;
++    if(screen->m_user_flip_call == true){
++        screen->m_hndl_user_callback(screen->m_user_data);
 +    }
-+    drmModeFreeObjectProperties(props);
-     return createScreen(m_integration, this, output, pos);
++
++    screen->m_flip_event.release(1);
  }
  
-@@ -330,11 +527,13 @@ drmModePropertyPtr QEglFSKmsDevice::connectorProperty(drmModeConnectorPtr connec
- }
+ QEglFSKmsGbmDevice::QEglFSKmsGbmDevice(QKmsScreenConfig *screenConfig, const QString &path)
+@@ -92,8 +127,12 @@ bool QEglFSKmsGbmDevice::open()
+         return false;
+     }
  
- QEglFSKmsDevice::QEglFSKmsDevice(QEglFSKmsIntegration *integration, const QString &path)
--    : m_integration(integration)
-+    : m_prop_fbId(0)
-+    , m_integration(integration)
-     , m_path(path)
-     , m_dri_fd(-1)
-     , m_crtc_allocator(0)
-     , m_connector_allocator(0)
-+    , m_plane_allocator(0)
- {
++    drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
++    drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1);
+     setFd(fd);
+ 
++    m_drm_page_flip_handler = new DrmPageFlipHandler(this);
++    m_drm_page_flip_handler->start();
+     return true;
  }
  
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.h
-index 041c063695..d0e52b8476 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.h
-@@ -47,7 +47,6 @@
+@@ -105,9 +144,16 @@ void QEglFSKmsGbmDevice::close()
+         gbm_device_destroy(m_gbm_device);
+         m_gbm_device = Q_NULLPTR;
+     }
++    m_drm_page_flip_handler->m_abort = true;
++    m_drm_page_flip_handler->wait();
++    delete m_drm_page_flip_handler;
++    m_drm_page_flip_handler = 0;
+ 
+     if (fd() != -1) {
++        drmSetClientCap(fd(), DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
++        drmSetClientCap(fd(), DRM_CLIENT_CAP_ATOMIC, 0);
+         qt_safe_close(fd());
++        qWarning("QEglFSKmsGBmDevice::close(): close DRM %d", fd());
+         setFd(-1);
+     }
+ }
+@@ -138,17 +184,6 @@ void QEglFSKmsGbmDevice::destroyGlobalCursor()
+     }
+ }
  
- #include <xf86drm.h>
- #include <xf86drmMode.h>
+-void QEglFSKmsGbmDevice::handleDrmEvent()
+-{
+-    drmEventContext drmEvent;
+-    memset(&drmEvent, 0, sizeof(drmEvent));
+-    drmEvent.version = 2;
+-    drmEvent.vblank_handler = nullptr;
+-    drmEvent.page_flip_handler = pageFlipHandler;
+-
+-    drmHandleEvent(fd(), &drmEvent);
+-}
 -
+ QPlatformScreen *QEglFSKmsGbmDevice::createScreen(const QKmsOutput &output)
+ {
+     QEglFSKmsGbmScreen *screen = new QEglFSKmsGbmScreen(this, output);
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
+index 08ca28d..855c75a 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
+@@ -50,7 +50,7 @@
  QT_BEGIN_NAMESPACE
  
- class Q_EGLFS_EXPORT QEglFSKmsDevice
-@@ -65,6 +64,13 @@ public:
-     int fd() const;
-     QString devicePath() const;
- 
-+    int setPlaneProperties(uint32_t objectType, uint32_t crtcId, uint32_t planeId, 
-+        uint8_t numProp, const char **propName, uint32_t *propVal);
-+    int getPlaneProperty(uint32_t objectType, uint32_t planeId, 
-+        const char *propName);
-+    int getPlane(uint32_t crtcId, uint8_t planeType);
-+    uint32_t m_prop_fbId;
-+
- protected:
-     virtual QEglFSKmsScreen *createScreen(QEglFSKmsIntegration *integration,
-                                           QEglFSKmsDevice *device,
-@@ -76,9 +82,9 @@ protected:
-     QString m_path;
-     int m_dri_fd;
+ class QEglFSKmsScreen;
+-
++class DrmPageFlipHandler;
+ class QEglFSKmsGbmDevice: public QEglFSKmsDevice
+ {
+ public:
+@@ -65,10 +65,14 @@ public:
+     QPlatformCursor *globalCursor() const;
+     void destroyGlobalCursor();
  
--    quint32 m_crtc_allocator;
--    quint32 m_connector_allocator;
+-    void handleDrmEvent();
 -
-+    quint64 m_crtc_allocator;
-+    quint64 m_connector_allocator;
-+    quint64 m_plane_allocator;
-     int crtcForConnector(drmModeResPtr resources, drmModeConnectorPtr connector);
-     QEglFSKmsScreen *screenForConnector(drmModeResPtr resources, drmModeConnectorPtr connector, QPoint pos);
-     drmModePropertyPtr connectorProperty(drmModeConnectorPtr connector, const QByteArray &name);
-@@ -90,6 +96,8 @@ protected:
-                                 void *user_data);
+     QPlatformScreen *createScreen(const QKmsOutput &output) override;
  
++    static void pageFlipHandler(int fd,
++                                unsigned int sequence,
++                                unsigned int tv_sec,
++                                unsigned int tv_usec,
++                                void *user_data);
++
  private:
-+    int getDrmPropId(drmModeObjectPropertiesPtr props,
-+        const char *name, unsigned int *propId);
-     Q_DISABLE_COPY(QEglFSKmsDevice)
- };
+     Q_DISABLE_COPY(QEglFSKmsGbmDevice)
  
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h
-index aa698e1b5d..d75b06945e 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h
-@@ -55,6 +55,7 @@ QT_BEGIN_NAMESPACE
- class QEglFSKmsDevice;
- class QEglFSKmsInterruptHandler;
+@@ -76,11 +80,7 @@ private:
  
-+#define MAX_NUM_PLANES 10
- struct QEglFSKmsOutput
- {
-     QString name;
-@@ -67,6 +68,7 @@ struct QEglFSKmsOutput
-     QList<drmModeModeInfo> modes;
-     int subpixel;
-     drmModePropertyPtr dpms_prop;
-+    uint32_t primary_plane_id;
+     QEglFSKmsGbmCursor *m_globalCursor;
+ 
+-    static void pageFlipHandler(int fd,
+-                                unsigned int sequence,
+-                                unsigned int tv_sec,
+-                                unsigned int tv_usec,
+-                                void *user_data);
++    DrmPageFlipHandler *m_drm_page_flip_handler;
  };
  
- class Q_EGLFS_EXPORT QEglFSKmsScreen : public QEglFSScreen
-diff --git a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp
-index fc41dc5643..3c2ee3db5a 100644
---- a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp
-+++ b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp
-@@ -345,4 +345,92 @@ void *QEGLDeviceIntegration::wlDisplay() const
-     return Q_NULLPTR;
+ QT_END_NAMESPACE
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+index b6cdcf9..8339fe4 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
+@@ -143,4 +143,107 @@ QKmsDevice *QEglFSKmsGbmIntegration::createDevice()
+     return new QEglFSKmsGbmDevice(screenConfig(), path);
  }
  
-+
-+int QEGLDeviceIntegration::exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
-+                                        uint32_t pixel_format, uint32_t *strides, uint32_t *offsets,
-+                                        uint32_t buf_fd, uint32_t *bufId)
++int QEglFSKmsGbmIntegration::exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
++                                          uint32_t pixel_format, uint32_t *strides, uint32_t *offsets,
++                                          uint32_t buf_fd, uint32_t *buf_id)
 +{
-+    Q_UNUSED(screen);
-+    Q_UNUSED(width);
-+    Q_UNUSED(height);
-+    Q_UNUSED(pixel_format);
-+    Q_UNUSED(strides);
-+    Q_UNUSED(offsets);
-+    Q_UNUSED(buf_fd);
-+    Q_UNUSED(bufId);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return (gbmScreen->addOverlayBuffer(width,
++            height, pixel_format, strides, offsets, buf_fd, buf_id));
++    }
 +
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::distroyBuffer(const QScreen *screen, uint32_t bufId)
++int QEglFSKmsGbmIntegration::distroyBuffer(const QScreen *screen, uint32_t buf_id)
 +{
-+    Q_UNUSED(screen)
-+        Q_UNUSED(bufId);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return (gbmScreen->removeOverlayBuffer(buf_id));
++    }
 +
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::setPlaneProperties(const QScreen *screen, 
-+                                              uint8_t planeType, uint8_t idx, uint8_t numProp,
-+                                              const char **propName, uint32_t *propVal)
++int QEglFSKmsGbmIntegration::setPlaneProperties(const QScreen *screen,
++                                                uint8_t planeType, uint8_t idx, uint8_t num_prop,
++                                                const char **propName, uint32_t *propVal)
 +{
-+    Q_UNUSED(screen);
-+    Q_UNUSED(planeType);
-+    Q_UNUSED(idx);
-+    Q_UNUSED(numProp);
-+    Q_UNUSED(propName);
-+    Q_UNUSED(propVal);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return(gbmScreen->setPlaneProperties(planeType, idx, num_prop, propName, propVal));
++    }
 +
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::getPlaneProperty(const QScreen *screen, 
-+                                            uint8_t planeType, uint8_t idx, 
-+                                            const char *propName)
++int QEglFSKmsGbmIntegration::getPlaneProperty(const QScreen *screen,
++                                              uint8_t planeType, uint8_t idx, const char *propName)
 +{
-+    Q_UNUSED(screen);
-+    Q_UNUSED(planeType);
-+    Q_UNUSED(idx);
-+    Q_UNUSED(propName);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return(gbmScreen->getPlaneProperty(planeType, idx, propName));
++    }
 +
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::createPlane(const QScreen *screen)
++int QEglFSKmsGbmIntegration::createPlane(const QScreen *screen)
 +{
-+    Q_UNUSED(screen);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return(gbmScreen->createOverlayPlane());
++    }
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::distroyPlane(const QScreen *screen, int planeId)
++int QEglFSKmsGbmIntegration::distroyPlane(const QScreen *screen, int planeId)
 +{
-+    Q_UNUSED(screen);
-+    Q_UNUSED(planeId);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return(gbmScreen->distroyOverlayPlane(planeId));
++    }
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::queuePlane(QScreen *screen,
-+                                      uint32_t idx, uint32_t fbId)
++int QEglFSKmsGbmIntegration::queuePlane(QScreen *screen,
++                                        uint32_t idx, uint32_t fbId)
 +{
-+    Q_UNUSED(screen);
-+    Q_UNUSED(idx);
-+    Q_UNUSED(fbId);
-+
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return(gbmScreen->queueOverlayPlane(idx, fbId));
++    }
 +    return -1;
 +}
 +
-+int QEGLDeviceIntegration::startDispPlane(QScreen *screen)
++int QEglFSKmsGbmIntegration::startDispPlane(QScreen *screen)
 +{
-+    Q_UNUSED(screen);
-+	return -1;
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++        return(gbmScreen->startDispOverlayPlane());
++    }
++    return -1;
 +}
 +
-+int QEGLDeviceIntegration::userCallBackHandle(QScreen *screen, void (*fnPtr)(void *), void *data)
++int QEglFSKmsGbmIntegration::userCallBackHandle(QScreen *screen,  void (*hndlUserCallBack)(void *), void *userData)
 +{
-+    Q_UNUSED(screen);
-+    Q_UNUSED(fnPtr);
-+    Q_UNUSED(data);
++    if(device())
++    {
++        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
++		gbmScreen->m_hndl_user_callback = hndlUserCallBack;
++		gbmScreen->m_user_data = userData;
++        return 0;
++    }
 +    return -1;
 +}
 +
  QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h
-index f1a5bde331..36fe3d2556 100644
---- a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h
-+++ b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h
-@@ -57,7 +57,6 @@
- #include <QtCore/QString>
- #include <QtGui/QSurfaceFormat>
- #include <QtGui/QImage>
--
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
+index 38f132d..ad11c6d 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
+@@ -63,6 +63,19 @@ public:
+ 
+     QPlatformCursor *createCursor(QPlatformScreen *screen) const override;
+     void presentBuffer(QPlatformSurface *surface) override;
++    int exportBuffer(const QScreen *screen, uint32_t width,
++        uint32_t height, uint32_t pixel_format, uint32_t *strides,
++        uint32_t *offsets, uint32_t buf_fd, uint32_t *buf_id) override;
++    int distroyBuffer(const QScreen *screen,uint32_t buf_id) override;
++    int setPlaneProperties(const QScreen *screen, uint8_t planeType,
++        uint8_t idx, uint8_t numProp, const char **propName, uint32_t *propVal) override;
++    int getPlaneProperty(const QScreen *screen, uint8_t planeType,
++        uint8_t idx, const char *propName) override;
++    int createPlane(const QScreen *screen) override;
++    int distroyPlane(const QScreen *screen, int planeId) override;
++    int queuePlane(QScreen *screen, uint32_t idx, uint32_t fbId) override;
++    int startDispPlane(QScreen *screen) override;
++    int userCallBackHandle(QScreen *screen, void (*fnPtr)(void *), void *data) override;
+ 
+ protected:
+     QKmsDevice *createDevice() override;
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
+index 87fb314..f498bf1 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
+@@ -49,11 +49,26 @@
+ #include <QtGui/private/qguiapplication_p.h>
+ #include <QtFbSupport/private/qfbvthandler_p.h>
+ 
+-#include <errno.h>
++#include <errno.h>
++#include <QThread>
++#include <QMutex>
++#include <string.h>
+ 
  QT_BEGIN_NAMESPACE
  
- class QPlatformSurface;
-@@ -105,6 +104,20 @@ public:
-     virtual bool supportsSurfacelessContexts() const;
+ Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
++class DrmPageFlip : public QThread
++{
++
++public:
++    DrmPageFlip(QEglFSKmsGbmScreen *screen)
++        : m_abort(false), m_gbm_screen(screen) {}
++    bool m_abort;
++    void run();
++
++private:
++    QEglFSKmsGbmScreen *m_gbm_screen;
++};
  
-     virtual void *wlDisplay() const;
-+    virtual int exportBuffer(const QScreen *screen, uint32_t width, 
-+        uint32_t height, uint32_t pixel_format,	uint32_t *strides, 
-+        uint32_t *offsets, uint32_t buf_fd, uint32_t *buf_id);
-+    virtual int distroyBuffer(const QScreen *screen, uint32_t buf_id);
-+    virtual int setPlaneProperties(const QScreen *screen, uint8_t planeType,
-+        uint8_t idx, uint8_t numProp, const char **propName,
-+        uint32_t *propVal);
-+    virtual int getPlaneProperty(const QScreen *screen, uint8_t planeType,
-+        uint8_t idx, const char *propName);
-+    virtual int createPlane(const QScreen *screen);
-+    virtual int distroyPlane(const QScreen *screen, int plane_id);
-+    virtual int queuePlane(QScreen *screen, uint32_t idx, uint32_t fb_id);
-+    virtual int startDispPlane(QScreen *screen);
-+    virtual int userCallBackHandle(QScreen *screen, void (*fnPtr)(void *), void *data);
- };
+ void QEglFSKmsGbmScreen::bufferDestroyedHandler(gbm_bo *bo, void *data)
+ {
+@@ -96,11 +111,20 @@ QEglFSKmsGbmScreen::FrameBuffer *QEglFSKmsGbmScreen::framebufferForBufferObject(
+ 
+ QEglFSKmsGbmScreen::QEglFSKmsGbmScreen(QKmsDevice *device, const QKmsOutput &output)
+     : QEglFSKmsScreen(device, output)
++    , m_qpa_flip_call(false)
++    , m_user_flip_call(false)
++	, m_start_flip_overlay_plane(false)
+     , m_gbm_surface(Q_NULLPTR)
+     , m_gbm_bo_current(Q_NULLPTR)
+     , m_gbm_bo_next(Q_NULLPTR)
+     , m_cursor(Q_NULLPTR)
++    , m_flip_primary_plane(false)
++    , m_plane_id{0}
++    , m_plane_idx(0)
++    , m_primary_plane_fb(0)
+ {
++    m_drm_page_flip = new DrmPageFlip(this);
++    m_drm_page_flip->start();
+ }
  
- class Q_EGLFS_EXPORT QEGLDeviceIntegrationPlugin : public QObject
-diff --git a/src/plugins/platforms/eglfs/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
-index 6f38a96f45..6120af3f59 100644
---- a/src/plugins/platforms/eglfs/qeglfsintegration.cpp
-+++ b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
-@@ -93,6 +93,8 @@ static void initResources()
- #endif
+ QEglFSKmsGbmScreen::~QEglFSKmsGbmScreen()
+@@ -109,6 +133,100 @@ QEglFSKmsGbmScreen::~QEglFSKmsGbmScreen()
+     qCDebug(qLcEglfsKmsDebug, "Screen dtor. Remaining screens: %d", remainingScreenCount);
+     if (!remainingScreenCount && !device()->screenConfig()->separateScreens())
+         static_cast<QEglFSKmsGbmDevice *>(device())->destroyGlobalCursor();
++    m_drm_page_flip->m_abort = true;
++    m_drm_page_flip->wait();
++    delete m_drm_page_flip;
++    m_drm_page_flip = 0;
++}
++
++/* This thread periodically cheks if there is any user submitted buffer for
++overlay with primary plane or if QT has drawn new surface (primary plane)
++to be displayed. In any or both of the case, this thread will do atomic
++submission of the new framebuffer id to the DRM device for display.
++Access to overlay plane queue and primary plane resources are Mutex protected
++with respective threads.
++*/
++void DrmPageFlip::run(){
++    while(m_abort == false){
++        drmModeAtomicReqPtr req = drmModeAtomicAlloc();
++        bool commit_overlay_plane = false;
++        bool commit_primary_plane = false;
++        uint32_t primary_plane_fb_id;
++        int ret = -1;
++
++        m_gbm_screen->m_primary_mutex.lock();
++        commit_primary_plane = m_gbm_screen->m_flip_primary_plane;
++        primary_plane_fb_id = m_gbm_screen->m_primary_plane_fb;
++        m_gbm_screen->m_flip_primary_plane = false;
++        m_gbm_screen->m_primary_mutex.unlock();
++
++        if(commit_primary_plane == true){
++            if((ret = drmModeAtomicAddProperty(req, m_gbm_screen->m_output.primary_plane_id,
++                m_gbm_screen->device()->m_prop_fbId, primary_plane_fb_id)) < 0){
++                    qWarning("failed to add property with error code = %d\n", ret);
++            }
++        }
++
++        //Check for any new buffer queued by user application
++        if (m_gbm_screen->m_start_flip_overlay_plane == true) {
++            m_gbm_screen->m_overlay_mutex.lock();
++            for(uint32_t i = 0 ; i < m_gbm_screen->m_plane_idx; i++) {
++                if (!m_gbm_screen->overlayPlaneFbIdQueue[i].isEmpty()) {
++                    uint32_t planeId = m_gbm_screen->m_plane_id[i];
++                    uint32_t fbId = m_gbm_screen->overlayPlaneFbIdQueue[i].dequeue();
++                    if((ret = drmModeAtomicAddProperty(req, planeId, m_gbm_screen->device()->m_prop_fbId, fbId)) < 0){
++                        qWarning("failed to add property with error code = %d\n", ret);
++                    }
++                    commit_overlay_plane = true;
++                }
++            }
++            m_gbm_screen->m_overlay_mutex.unlock();
++        }
++
++        if ((commit_primary_plane == true) || (commit_overlay_plane == true)) {
++            ret = drmModeAtomicCommit(m_gbm_screen->device()->fd(), req,
++                DRM_MODE_ATOMIC_TEST_ONLY, 0);
++
++            if (!ret) {
++                if(commit_overlay_plane == true) {
++                    m_gbm_screen->m_user_flip_call = true;
++                }
++
++                if(commit_primary_plane == true) {
++                    m_gbm_screen->m_qpa_flip_call = true;
++                }
++
++                drmModeAtomicCommit(m_gbm_screen->device()->fd(), req,
++                    DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, m_gbm_screen);
++
++                //sleeping for 5 msec, assuming that display is not running at more than 120 fps
++                msleep(5);
++                while(m_gbm_screen->m_flip_event.tryAcquire(1) == false) {
++                    usleep(500);
++                }
++                m_gbm_screen->m_qpa_flip_call = false;
++                m_gbm_screen->m_user_flip_call = false;
++
++                msleep(1);
++            }
++            else {
++                if (m_gbm_screen->m_qpa_flip_call == true) {
++                    qErrnoWarning("Could not queue DRM page flip!");
++                    gbm_surface_release_buffer(m_gbm_screen->m_gbm_surface, m_gbm_screen->m_gbm_bo_next);
++                    m_gbm_screen->m_gbm_bo_next = Q_NULLPTR;
++                }
++
++                if (commit_overlay_plane == true) {
++                    qErrnoWarning("Could not page flip user overlay plane!");
++                    m_gbm_screen->m_hndl_user_callback(m_gbm_screen->m_user_data);
++                }
++            }
++        }
++        else{
++            msleep(1);
++        }
++        drmModeAtomicFree(req);
++    }
  }
  
-+Q_DECLARE_LOGGING_CATEGORY(qLcEglDevDebug)
+ QPlatformCursor *QEglFSKmsGbmScreen::cursor() const
+@@ -167,8 +285,10 @@ void QEglFSKmsGbmScreen::waitForFlip()
+         return;
+ 
+     QMutexLocker lock(&m_waitForFlipMutex);
+-    while (m_gbm_bo_next)
+-        static_cast<QEglFSKmsGbmDevice *>(device())->handleDrmEvent();
++    while (m_gbm_bo_next){
++        usleep(200);
++    }
 +
- QT_BEGIN_NAMESPACE
+ }
  
- QEglFSIntegration::QEglFSIntegration()
-@@ -259,7 +261,16 @@ enum ResourceType {
-     EglConfig,
-     NativeDisplay,
-     XlibDisplay,
--    WaylandDisplay
-+    WaylandDisplay,
-+    ExportBuffer,
-+    DistroyBuffer,
-+    SetPlaneProperties,
-+    GetPlaneProperty,
-+    CreatePlane,
-+    DistroyPlane,
-+    QueuePlane,
-+    StartDispPlane,
-+    UserCallBackHandl,
- };
+ void QEglFSKmsGbmScreen::flip()
+@@ -200,7 +320,7 @@ void QEglFSKmsGbmScreen::flip()
+                                  &op.modes[op.mode]);
+ 
+         if (ret == -1) {
+-            qErrnoWarning(errno, "Could not set DRM mode!");
++            qErrnoWarning(errno, "Could not set DRM (%d) CRTC (%d) mode!", fd, op.crtc_id);
+         } else {
+             op.mode_set = true;
+             setPowerState(PowerStateOn);
+@@ -219,16 +339,10 @@ void QEglFSKmsGbmScreen::flip()
+         }
+     }
+ 
+-    int ret = drmModePageFlip(fd,
+-                              op.crtc_id,
+-                              fb->fb,
+-                              DRM_MODE_PAGE_FLIP_EVENT,
+-                              this);
+-    if (ret) {
+-        qErrnoWarning("Could not queue DRM page flip!");
+-        gbm_surface_release_buffer(m_gbm_surface, m_gbm_bo_next);
+-        m_gbm_bo_next = Q_NULLPTR;
+-    }
++    m_primary_mutex.lock();
++    m_primary_plane_fb = fb->fb;
++    m_flip_primary_plane = true;
++    m_primary_mutex.unlock();
+ }
  
- static int resourceType(const QByteArray &key)
-@@ -271,7 +282,16 @@ static int resourceType(const QByteArray &key)
-         QByteArrayLiteral("eglconfig"),
-         QByteArrayLiteral("nativedisplay"),
-         QByteArrayLiteral("display"),
--        QByteArrayLiteral("server_wl_display")
-+        QByteArrayLiteral("server_wl_display"),
-+        QByteArrayLiteral("export_buffer"),
-+        QByteArrayLiteral("distroy_buffer"),
-+        QByteArrayLiteral("set_plane_properties"),
-+        QByteArrayLiteral("get_plane_property"),
-+        QByteArrayLiteral("create_plane"),
-+        QByteArrayLiteral("distroy_plane"),
-+        QByteArrayLiteral("queue_plane"),
-+        QByteArrayLiteral("start_disp_plane"),
-+        QByteArrayLiteral("user_call_back_handle"),
-     };
-     const QByteArray *end = names + sizeof(names) / sizeof(names[0]);
-     const QByteArray *result = std::find(names, end, key);
-@@ -280,6 +300,61 @@ static int resourceType(const QByteArray &key)
-     return int(result - names);
+ void QEglFSKmsGbmScreen::flipFinished()
+@@ -241,4 +355,132 @@ void QEglFSKmsGbmScreen::flipFinished()
+     m_gbm_bo_next = Q_NULLPTR;
  }
  
-+static int exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
-+                        uint32_t pixel_format, uint32_t *strides, uint32_t *offsets, 
-+                        uint32_t buf_fd, uint32_t *buf_id)
++int QEglFSKmsGbmScreen::addOverlayBuffer(uint32_t width,
++                                         uint32_t height,
++                                         uint32_t pixel_format,
++                                         uint32_t *strides,
++                                         uint32_t *offsets,
++                                         uint32_t buf_fd,
++                                         uint32_t *buf_id)
 +{
-+    return(qt_egl_device_integration()->exportBuffer(screen, width, 
-+        height, pixel_format, strides, offsets, buf_fd, buf_id));
-+}
++    /* Get the buffer handle from the exported buffer fd */
++    uint32_t bo_handle;
++    drmPrimeFDToHandle(m_device->fd(), buf_fd, &bo_handle);
++    int ret = drmModeAddFB2(m_device->fd(), width, height, pixel_format, &bo_handle,\
++        strides, offsets, buf_id, 0);
 +
-+static int distroyBuffer(const QScreen *screen, uint32_t buf_id)
-+{
-+    return(qt_egl_device_integration()->distroyBuffer(screen, buf_id));
++    if (ret) {
++		qWarning() << "addOverlayBuffer: drmModeAddFB2 failed:" << strerror(errno) << ret;
++        return -1;
++    }
++    return ret;
 +}
 +
-+static int setPlaneProperties(const QScreen *screen, uint8_t planeType,
-+                              uint32_t idx, uint8_t num_prop, const char **prop_name, uint32_t *prop_val)
++int QEglFSKmsGbmScreen::removeOverlayBuffer(uint32_t buf_id)
 +{
-+    return (qt_egl_device_integration()->setPlaneProperties(
-+        screen, planeType, idx, num_prop, prop_name, prop_val));
++    int ret = drmModeRmFB(m_device->fd(), buf_id);
++
++    if (ret) {
++		qWarning() << "removeOverlayBuffer: drmModeRmFB failed:" << strerror(errno) << ret;
++        return -1;
++    }
++    return ret;
 +}
 +
-+static int getPlaneProperty(const QScreen *screen, uint8_t planeType, uint32_t idx, 
-+                            const char *propName)
++int QEglFSKmsGbmScreen::setPlaneProperties(uint8_t planeType, uint8_t idx,
++                                           uint8_t numProp, const char **propName, uint32_t *propVal)
 +{
-+    return (qt_egl_device_integration()->getPlaneProperty(
-+        screen, planeType, idx, propName));
++    uint32_t planeId, crtcId;
++    uint32_t objectType;
++    crtcId = m_output.crtc_id;
++
++	if (idx > MAX_NUM_PLANES){
++		qWarning("queueOverlayPlane: invalid plane index\n");
++		return -1;
++    }
++
++    if(planeType == DRM_PLANE_TYPE_OVERLAY){
++        planeId = m_plane_id[idx];
++        objectType = DRM_MODE_OBJECT_PLANE;
++    }
++    else if(planeType == DRM_PLANE_TYPE_PRIMARY){
++        objectType = DRM_MODE_OBJECT_CRTC;
++        planeId = crtcId;
++    }
++    else{
++		qWarning() << "setPlaneProperties: invalid plane type";
++        return -1;
++    }
++    return m_device->setPlaneProperties(objectType, crtcId, planeId, numProp, propName, propVal);
 +}
 +
-+static int createPlane(QScreen *screen)
++int QEglFSKmsGbmScreen::getPlaneProperty(uint8_t planeType, uint8_t idx, const char *propName)
 +{
-+    return(qt_egl_device_integration()->createPlane(screen));
++    uint32_t planeId, crtcId;
++    uint32_t objectType;
++    crtcId = m_output.crtc_id;
++
++	if (idx > MAX_NUM_PLANES){
++		qWarning("queueOverlayPlane: invalid plane index\n");
++		return -1;
++    }
++
++    if(planeType == DRM_PLANE_TYPE_OVERLAY){
++        planeId = m_plane_id[idx];
++        objectType = DRM_MODE_OBJECT_PLANE;
++    }
++    else if(planeType == DRM_PLANE_TYPE_PRIMARY){
++        objectType = DRM_MODE_OBJECT_CRTC;
++        planeId = crtcId;
++    }
++    else{
++		qWarning() << "getPlaneProperty: invalid plane type";
++        return -1;
++    }
++    return m_device->getPlaneProperty(objectType, planeId, propName);
 +}
 +
-+static int distroyPlane(QScreen *screen, int plane_id)
++int QEglFSKmsGbmScreen::createOverlayPlane()
 +{
-+    return (qt_egl_device_integration()->distroyPlane(screen, plane_id));
++    int planeId = m_device->getPlane(0, DRM_PLANE_TYPE_OVERLAY);
++    if (planeId > 0){
++        uint8_t pcnt = m_plane_idx++;
++        if(pcnt > MAX_NUM_PLANES){
++			qWarning() << "createOverlayPlane: Don't support number of planes greater then" <<  MAX_NUM_PLANES;
++        }
++        m_plane_id[pcnt] = planeId;
++        return pcnt;
++    }
++    else {
++        qWarning() << "createOverlayPlane: cannot find free plane";
++        return -1;
++    }
 +}
 +
-+static int queuePlane(QScreen *screen,
-+                      uint32_t idx, uint32_t fb_id)
++int QEglFSKmsGbmScreen::distroyOverlayPlane(int pcnt)
 +{
-+    return (qt_egl_device_integration()->queuePlane(screen,
-+        idx, fb_id));
++    int planeId = m_plane_id[pcnt];
++    Q_UNUSED(planeId);
++    //nothing to be done to distroy the plane
++    return 0;
 +}
 +
-+static int startDispPlane(QScreen *screen)
++int QEglFSKmsGbmScreen::queueOverlayPlane(uint32_t idx, uint32_t fbId)
 +{
-+    return (qt_egl_device_integration()->startDispPlane(screen));
++    if (idx > MAX_NUM_PLANES){
++        qWarning("queueOverlayPlane: invalid plane index\n");
++        return -1;
++    }
++    m_overlay_mutex.lock();
++    overlayPlaneFbIdQueue[idx].enqueue(fbId);
++    m_overlay_mutex.unlock();
++    return 0;
 +}
 +
-+static int userCallBackHandle(QScreen *screen,  void (*funPtr)(void *), void *data)
++int QEglFSKmsGbmScreen::startDispOverlayPlane()
 +{
-+    return (qt_egl_device_integration()->userCallBackHandle(screen,
-+        funPtr, data));
++    m_start_flip_overlay_plane = true;
++    return 0;
 +}
 +
- void *QEglFSIntegration::nativeResourceForIntegration(const QByteArray &resource)
+ QT_END_NAMESPACE
+diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
+index 341cc95..7faf6a1 100644
+--- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
++++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
+@@ -44,12 +44,18 @@
+ 
+ #include "qeglfskmsscreen.h"
+ #include <QtCore/QMutex>
++#include <QtCore/QSemaphore>
++#include <QtCore/QQueue>
+ 
+ #include <gbm.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
++#define MAX_NUM_PLANES 10
++
+ class QEglFSKmsGbmCursor;
++class DrmPageFlip;
++typedef void (*m_fnptr_user_callback)(void *data);
+ 
+ class QEglFSKmsGbmScreen : public QEglFSKmsScreen
  {
-     void *result = 0;
-@@ -294,6 +369,33 @@ void *QEglFSIntegration::nativeResourceForIntegration(const QByteArray &resource
-     case WaylandDisplay:
-         result = qt_egl_device_integration()->wlDisplay();
-         break;
-+    case ExportBuffer:
-+        result = reinterpret_cast<void *>(exportBuffer);
-+        break;
-+    case DistroyBuffer:
-+        result = reinterpret_cast<void *>(distroyBuffer);
-+        break;
-+    case CreatePlane:
-+        result = reinterpret_cast<void *>(createPlane);
-+        break;
-+    case DistroyPlane:
-+        result = reinterpret_cast<void *>(distroyPlane);
-+        break;
-+    case SetPlaneProperties:
-+        result = reinterpret_cast<void *>(setPlaneProperties);
-+        break;
-+    case GetPlaneProperty:
-+        result = reinterpret_cast<void *>(getPlaneProperty);
-+        break;
-+    case QueuePlane:
-+        result = reinterpret_cast<void *>(queuePlane);
-+        break;
-+    case StartDispPlane:
-+        result = reinterpret_cast<void *>(startDispPlane);
-+        break;
-+    case UserCallBackHandl:
-+        result = reinterpret_cast<void *>(userCallBackHandle);
-+        break;
-     default:
-         break;
-     }
+@@ -67,6 +73,30 @@ public:
+     void flip() override;
+     void flipFinished() override;
+ 
++    int addOverlayBuffer(uint32_t width,
++        uint32_t height,
++        uint32_t pixel_format,
++        uint32_t *strides,
++        uint32_t *offsets,
++        uint32_t buf_fd,
++        uint32_t *buf_id);
++    int removeOverlayBuffer(uint32_t buf_id);
++    int setPlaneProperties(uint8_t planeType, uint8_t idx,
++        uint8_t numProp, const char **propName, uint32_t *propVal);
++    int getPlaneProperty(uint8_t planeType, uint8_t idx, const char *propName);
++    int createOverlayPlane();
++    int distroyOverlayPlane(int pcnt);
++    int queueOverlayPlane(uint32_t idx, uint32_t fbId);
++    int startDispOverlayPlane();
++    m_fnptr_user_callback m_hndl_user_callback;
++    void *m_user_data;
++    bool m_qpa_flip_call;
++    bool m_user_flip_call;
++    bool m_start_flip_overlay_plane;
++    QMutex m_flip_mutex;
++    QSemaphore m_flip_event;
++    friend class DrmPageFlip;
++
+ private:
+     gbm_surface *m_gbm_surface;
+ 
+@@ -83,6 +113,15 @@ private:
+     FrameBuffer *framebufferForBufferObject(gbm_bo *bo);
+ 
+     static QMutex m_waitForFlipMutex;
++
++    bool m_flip_primary_plane;
++    QMutex m_overlay_mutex;
++    QMutex m_primary_mutex;
++    QQueue<uint32_t> overlayPlaneFbIdQueue[MAX_NUM_PLANES];
++    uint32_t m_plane_id[MAX_NUM_PLANES];
++    uint8_t m_plane_idx;
++    uint32_t m_primary_plane_fb;
++    DrmPageFlip *m_drm_page_flip;
+ };
+ 
+ QT_END_NAMESPACE
 -- 
-2.13.0
+1.9.1
 
diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
index cbdeb1e..57f5553 100644
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk5.2"
+PR_append = ".tisdk5.3"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -24,8 +24,8 @@ QT_NOSGX_PATCHES = "\
 
 SRC_URI += "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_NOSGX_PATCHES}", d)}\
+    file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch \
 "
-#    file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch        
 
 python do_patch_append() {
     import shutil
-- 
1.9.1


