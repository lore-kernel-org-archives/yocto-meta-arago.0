Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DA2B552092
	for <meta-arago@arago-project.org>;
	Mon, 17 Jun 2019 13:25:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HDPDb4050601
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 08:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560777913;
	bh=Gu/0qS6qTBNS75v9KVQUvINPzHVcyg8Dd6iT3QGR47k=;
	h=From:To:Subject:Date;
	b=TwQAqFw0HzmETxoKMR3RDB6Ugf3837X3c3xTaTOvCzg8MBvJqQZWGai1mW13xoijP
	laQGKRVsmxVMHGrG7Lw+FzeNRlHGuqSx4ZOVibze4PM3cSYvqAXu7uoBBWAKSNfxwg
	I5c23TcxwMGx1V6TESoGNcD1jo8MOks05L0b92OU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HDPDwS082313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 08:25:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 17 Jun 2019 08:25:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 17 Jun 2019 08:25:12 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HDPCMO074882
	for <meta-arago@arago-project.org>; Mon, 17 Jun 2019 08:25:12 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Jun 2019 09:24:53 -0400
Message-ID: <20190617132453.63948-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] qtbase: rebase and re-enable QPA eglfs_kms enhancements
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
X-List-Received-Date: Mon, 17 Jun 2019 13:25:59 -0000
Content-Type: text/plain

- rebase QPA eglfs_kms enhancements to QT5.11.3
- removed unused patch

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e-the-QPA-for-multiple-display-and-u.patch | 347 +++----
 ...glfs_kms-to-handle-DRM-plane-set-req.patch | 877 ------------------
 recipes-qt/qt5/qtbase_%.bbappend              |   4 +-
 3 files changed, 187 insertions(+), 1041 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch

diff --git a/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch b/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
index 1906a33..b8dec5a 100644
--- a/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
+++ b/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
@@ -1,6 +1,6 @@
-From e1dee76a81fb16966ecf1f09c2a7c6fbcfb63bb9 Mon Sep 17 00:00:00 2001
+From b13a98d7334ba57cbb584b7c88ba94e689a2596b Mon Sep 17 00:00:00 2001
 From: Manisha Agrawal <manisha.agrawal@ti.com>
-Date: Wed, 26 Dec 2018 10:50:14 -0500
+Date: Fri, 14 Jun 2019 13:43:23 -0400
 Subject: [PATCH] eglfs_kms: enhance the QPA for multiple display and user
  buffer
 
@@ -8,6 +8,8 @@ Enhance the QPA to support multiple screens and to accept the buffers
 from user application to overlay on QT drawn surface utilizing the
 underneath display IP scaling, overlaying and alphablending feature.
 
+rebase for QT5.11.3
+
 This QPA has following limitations -
 1. It only supports importing user overlay buffer. It doesn't
 suport allocating the buffer for overlay plane inside QPA and exporting to user
@@ -21,25 +23,26 @@ of user/overlay plane. There is no corresponding API as stopDispPlane to
 stop displaying of user/overlay plane.
 
 Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- src/platformsupport/kmsconvenience/qkmsdevice.cpp  | 208 +++++++++++++++-
- src/platformsupport/kmsconvenience/qkmsdevice_p.h  |  14 +-
- .../eglfs/api/qeglfsdeviceintegration.cpp          |  87 +++++++
- .../eglfs/api/qeglfsdeviceintegration_p.h          |  14 ++
- .../platforms/eglfs/api/qeglfsintegration.cpp      | 104 +++++++-
- .../eglfs_kms/qeglfskmsgbmdevice.cpp               |  97 ++++++--
- .../eglfs_kms/qeglfskmsgbmdevice.h                 |  16 +-
- .../eglfs_kms/qeglfskmsgbmintegration.cpp          | 103 ++++++++
- .../eglfs_kms/qeglfskmsgbmintegration.h            |  13 +
- .../eglfs_kms/qeglfskmsgbmscreen.cpp               | 268 ++++++++++++++++++++-
- .../eglfs_kms/qeglfskmsgbmscreen.h                 |  39 +++
- 11 files changed, 918 insertions(+), 45 deletions(-)
+ .../kmsconvenience/qkmsdevice.cpp             | 207 ++++++++++++-
+ .../kmsconvenience/qkmsdevice_p.h             |  12 +-
+ .../eglfs/api/qeglfsdeviceintegration.cpp     |  87 ++++++
+ .../eglfs/api/qeglfsdeviceintegration_p.h     |  14 +
+ .../platforms/eglfs/api/qeglfsintegration.cpp | 104 ++++++-
+ .../eglfs_kms/qeglfskmsgbmdevice.cpp          |  89 ++++++
+ .../eglfs_kms/qeglfskmsgbmdevice.h            |  10 +-
+ .../eglfs_kms/qeglfskmsgbmintegration.cpp     | 102 ++++++
+ .../eglfs_kms/qeglfskmsgbmintegration.h       |  13 +
+ .../eglfs_kms/qeglfskmsgbmscreen.cpp          | 292 +++++++++++++++---
+ .../eglfs_kms/qeglfskmsgbmscreen.h            |  47 ++-
+ 11 files changed, 922 insertions(+), 55 deletions(-)
 
 diff --git a/src/platformsupport/kmsconvenience/qkmsdevice.cpp b/src/platformsupport/kmsconvenience/qkmsdevice.cpp
-index a8eefe6..a6478ed 100644
+index a5895559e60..5b96375922a 100644
 --- a/src/platformsupport/kmsconvenience/qkmsdevice.cpp
 +++ b/src/platformsupport/kmsconvenience/qkmsdevice.cpp
-@@ -61,6 +61,179 @@ enum OutputConfiguration {
+@@ -63,6 +63,179 @@ enum OutputConfiguration {
      OutputConfigModeline
  };
  
@@ -219,15 +222,15 @@ index a8eefe6..a6478ed 100644
  int QKmsDevice::crtcForConnector(drmModeResPtr resources, drmModeConnectorPtr connector)
  {
      for (int i = 0; i < connector->count_encoders; i++) {
-@@ -175,6 +348,7 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
-     OutputConfiguration configuration;
+@@ -179,6 +352,7 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
      QSize configurationSize;
+     int configurationRefresh = 0;
      drmModeModeInfo configurationModeline;
 +    int primary_plane_id;
  
      auto userConfig = m_screenConfig->outputSettings();
-     auto userConnectorConfig = userConfig.value(QString::fromUtf8(connectorName));
-@@ -286,14 +460,14 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+     QVariantMap userConnectorConfig = userConfig.value(QString::fromUtf8(connectorName));
+@@ -296,14 +470,14 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
  
      int selected_mode = -1;
  
@@ -246,50 +249,49 @@ index a8eefe6..a6478ed 100644
  
      if (selected_mode < 0) {
          qWarning() << "No modes available for output" << connectorName;
-@@ -306,6 +480,12 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+@@ -316,6 +490,12 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
                                    << '@' << refresh << "hz for output" << connectorName;
      }
  
 +    primary_plane_id = getPlane(crtc_id, DRM_PLANE_TYPE_PRIMARY);
 +
 +    if(primary_plane_id < 0){
-+        return Q_NULLPTR;
++        return nullptr;
 +    }
 +
      // physical size from connector < config values < env vars
      int pwidth = qEnvironmentVariableIntValue("QT_QPA_EGLFS_PHYSICAL_WIDTH");
      if (!pwidth)
-@@ -337,7 +517,8 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
-         connectorProperty(connector, QByteArrayLiteral("DPMS")),
-         false,
-         0,
--        false
-+        false,
-+        primary_plane_id
-     };
+@@ -385,7 +565,7 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
+     output.forced_plane_set = false;
+     output.drm_format = drmFormat;
+     output.clone_source = cloneSource;
+-
++    output.primary_plane_id = primary_plane_id;
+     QString planeListStr;
+     for (const QKmsPlane &plane : qAsConst(m_planes)) {
+         if (plane.possibleCrtcs & (1 << output.crtc_index)) {
+@@ -424,6 +604,19 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
  
-     bool ok;
-@@ -363,6 +544,19 @@ QPlatformScreen *QKmsDevice::createScreenForConnector(drmModeResPtr resources,
-     m_crtc_allocator |= (1 << output.crtc_id);
-     m_connector_allocator |= (1 << output.connector_id);
+     vinfo->output = output;
  
 +    drmModeObjectProperties	*props = drmModeObjectGetProperties(m_dri_fd, primary_plane_id,
 +        DRM_MODE_OBJECT_PLANE);
 +    if(props == NULL){
 +		qWarning() << "drm object properties for planeId:" << primary_plane_id << "is NULL";
-+        return NULL;
++        return nullptr;
 +    }
 +
 +    if(getDrmPropId(props, "FB_ID", &m_prop_fbId) < 0){
 +        drmModeFreeObjectProperties(props);
 +        qWarning() << "Couldn't get DRM property id for FB_ID";
-+        return NULL;
++        return nullptr;
 +    }
 +    drmModeFreeObjectProperties(props);
      return createScreen(output);
  }
  
-@@ -383,11 +577,13 @@ drmModePropertyPtr QKmsDevice::connectorProperty(drmModeConnectorPtr connector,
+@@ -461,10 +654,12 @@ drmModePropertyBlobPtr QKmsDevice::connectorPropertyBlob(drmModeConnectorPtr con
  }
  
  QKmsDevice::QKmsDevice(QKmsScreenConfig *screenConfig, const QString &path)
@@ -299,24 +301,24 @@ index a8eefe6..a6478ed 100644
      , m_path(path)
      , m_dri_fd(-1)
      , m_crtc_allocator(0)
-     , m_connector_allocator(0)
 +    , m_plane_allocator(0)
  {
      if (m_path.isEmpty()) {
          m_path = m_screenConfig->devicePath();
 diff --git a/src/platformsupport/kmsconvenience/qkmsdevice_p.h b/src/platformsupport/kmsconvenience/qkmsdevice_p.h
-index 35a51c1..e645157 100644
+index 5eecedec393..ae973dbe16a 100644
 --- a/src/platformsupport/kmsconvenience/qkmsdevice_p.h
 +++ b/src/platformsupport/kmsconvenience/qkmsdevice_p.h
-@@ -109,6 +109,7 @@ struct QKmsOutput
-     bool wants_plane;
-     uint32_t plane_id;
-     bool plane_set;
+@@ -191,7 +191,7 @@ struct QKmsOutput
+     uint32_t drm_format = DRM_FORMAT_XRGB8888;
+     QString clone_source;
+     QVector<QKmsPlane> available_planes;
+-
 +    uint32_t primary_plane_id;
- 
      void restoreMode(QKmsDevice *device);
      void cleanup(QKmsDevice *device);
-@@ -139,6 +140,12 @@ public:
+     QPlatformScreen::SubpixelAntialiasingType subpixelAntialiasingTypeHint() const;
+@@ -221,6 +221,12 @@ public:
      QString devicePath() const;
  
      QKmsScreenConfig *screenConfig() const;
@@ -329,15 +331,13 @@ index 35a51c1..e645157 100644
  
  protected:
      virtual QPlatformScreen *createScreen(const QKmsOutput &output) = 0;
-@@ -158,10 +165,13 @@ protected:
-     QString m_path;
+@@ -249,10 +255,12 @@ protected:
      int m_dri_fd;
  
--    quint32 m_crtc_allocator;
--    quint32 m_connector_allocator;
-+    quint64 m_crtc_allocator;
-+    quint64 m_connector_allocator;
-+    quint64 m_plane_allocator;
+     quint32 m_crtc_allocator;
+-
++    quint64 m_plane_allocator; // TBD: m_planes are new
+     QVector<QKmsPlane> m_planes;
  
  private:
 +    int getDrmPropId(drmModeObjectPropertiesPtr props,
@@ -346,10 +346,10 @@ index 35a51c1..e645157 100644
  };
  
 diff --git a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp
-index e411ea5..1722d74 100644
+index f1517134008..ba948ccb902 100644
 --- a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp
 +++ b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration.cpp
-@@ -374,4 +374,91 @@ EGLConfig QEglFSDeviceIntegration::chooseConfig(EGLDisplay display, const QSurfa
+@@ -393,4 +393,91 @@ EGLConfig QEglFSDeviceIntegration::chooseConfig(EGLDisplay display, const QSurfa
      return chooser.chooseConfig();
  }
  
@@ -442,10 +442,10 @@ index e411ea5..1722d74 100644
 +
  QT_END_NAMESPACE
 diff --git a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h
-index 4335554..b3d8fa0 100644
+index 71ffb4c69a4..5d3b065085b 100644
 --- a/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h
 +++ b/src/plugins/platforms/eglfs/api/qeglfsdeviceintegration_p.h
-@@ -107,6 +107,20 @@ public:
+@@ -109,6 +109,20 @@ public:
      virtual void *wlDisplay() const;
  
      static EGLConfig chooseConfig(EGLDisplay display, const QSurfaceFormat &format);
@@ -467,7 +467,7 @@ index 4335554..b3d8fa0 100644
  
  class Q_EGLFS_EXPORT QEglFSDeviceIntegrationPlugin : public QObject
 diff --git a/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
-index 9a0be48..81a1848 100644
+index 33878a5f50f..419df30e319 100644
 --- a/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
 +++ b/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
 @@ -287,7 +287,16 @@ enum ResourceType {
@@ -600,24 +600,22 @@ index 9a0be48..81a1848 100644
 +        result = reinterpret_cast<void *>(userCallBackHandle);
 +        break;
      default:
+         result = qt_egl_device_integration()->nativeResourceForIntegration(resource);
          break;
-     }
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-index e218d58..2a1b4b4 100644
+index 20127ae7f78..bf1fc4c5b4d 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-@@ -46,6 +46,10 @@
+@@ -46,13 +46,91 @@
  
  #include <QtCore/QLoggingCategory>
  #include <QtCore/private/qcore_unix_p.h>
 +#include <QThread>
-+
-+#include <sys/select.h>
-+
  
++#include <sys/select.h>
  #define ARRAY_LENGTH(a) (sizeof (a) / sizeof (a)[0])
  
-@@ -53,6 +57,62 @@ QT_BEGIN_NAMESPACE
+ QT_BEGIN_NAMESPACE
  
  Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
  
@@ -677,15 +675,13 @@ index e218d58..2a1b4b4 100644
 +	}
 +}
 +
- void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
- {
-     Q_UNUSED(fd);
-@@ -60,8 +120,17 @@ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned
-     Q_UNUSED(tv_sec);
-     Q_UNUSED(tv_usec);
- 
--    QEglFSKmsScreen *screen = static_cast<QEglFSKmsScreen *>(user_data);
--    screen->flipFinished();
++void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
++{
++    Q_UNUSED(fd);
++    Q_UNUSED(sequence);
++    Q_UNUSED(tv_sec);
++    Q_UNUSED(tv_usec);
++
 +    QEglFSKmsGbmScreen *screen = static_cast<QEglFSKmsGbmScreen *>(user_data);
 +
 +    if(screen->m_qpa_flip_call == true){
@@ -697,10 +693,12 @@ index e218d58..2a1b4b4 100644
 +    }
 +
 +    screen->m_flip_event.release(1);
- }
- 
++}
++
  QEglFSKmsGbmDevice::QEglFSKmsGbmDevice(QKmsScreenConfig *screenConfig, const QString &path)
-@@ -92,8 +161,12 @@ bool QEglFSKmsGbmDevice::open()
+     : QEglFSKmsDevice(screenConfig, path)
+     , m_gbm_device(nullptr)
+@@ -81,8 +159,12 @@ bool QEglFSKmsGbmDevice::open()
          return false;
      }
  
@@ -713,44 +711,23 @@ index e218d58..2a1b4b4 100644
      return true;
  }
  
-@@ -104,9 +177,16 @@ void QEglFSKmsGbmDevice::close()
-     if (m_gbm_device) {
-         gbm_device_destroy(m_gbm_device);
-         m_gbm_device = Q_NULLPTR;
--    }
-+    }
-+
+@@ -95,7 +177,14 @@ void QEglFSKmsGbmDevice::close()
+         m_gbm_device = nullptr;
+     }
+ 
 +    m_drm_page_flip_handler->m_abort = true;
 +    m_drm_page_flip_handler->wait();
 +    delete m_drm_page_flip_handler;
 +    m_drm_page_flip_handler = 0;
- 
++
      if (fd() != -1) {
 +        drmSetClientCap(fd(), DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 +        drmSetClientCap(fd(), DRM_CLIENT_CAP_ATOMIC, 0);
          qt_safe_close(fd());
          setFd(-1);
      }
-@@ -138,17 +218,6 @@ void QEglFSKmsGbmDevice::destroyGlobalCursor()
-     }
- }
- 
--void QEglFSKmsGbmDevice::handleDrmEvent()
--{
--    drmEventContext drmEvent;
--    memset(&drmEvent, 0, sizeof(drmEvent));
--    drmEvent.version = 2;
--    drmEvent.vblank_handler = nullptr;
--    drmEvent.page_flip_handler = pageFlipHandler;
--
--    drmHandleEvent(fd(), &drmEvent);
--}
--
- QPlatformScreen *QEglFSKmsGbmDevice::createScreen(const QKmsOutput &output)
- {
-     QEglFSKmsGbmScreen *screen = new QEglFSKmsGbmScreen(this, output);
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-index 08ca28d..855c75a 100644
+index 518e2ce58b1..98a06024f0b 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
 @@ -50,7 +50,7 @@
@@ -762,13 +739,9 @@ index 08ca28d..855c75a 100644
  class QEglFSKmsGbmDevice: public QEglFSKmsDevice
  {
  public:
-@@ -65,10 +65,14 @@ public:
-     QPlatformCursor *globalCursor() const;
-     void destroyGlobalCursor();
- 
--    void handleDrmEvent();
--
-     QPlatformScreen *createScreen(const QKmsOutput &output) override;
+@@ -71,12 +71,20 @@ public:
+                                QPlatformScreen *screenThisScreenClones,
+                                const QVector<QPlatformScreen *> &screensCloningThisScreen) override;
  
 +    static void pageFlipHandler(int fd,
 +                                unsigned int sequence,
@@ -779,25 +752,20 @@ index 08ca28d..855c75a 100644
  private:
      Q_DISABLE_COPY(QEglFSKmsGbmDevice)
  
-@@ -76,11 +80,7 @@ private:
+     gbm_device *m_gbm_device;
  
      QEglFSKmsGbmCursor *m_globalCursor;
- 
--    static void pageFlipHandler(int fd,
--                                unsigned int sequence,
--                                unsigned int tv_sec,
--                                unsigned int tv_usec,
--                                void *user_data);
++
 +    DrmPageFlipHandler *m_drm_page_flip_handler;
  };
  
  QT_END_NAMESPACE
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-index b6cdcf9..8339fe4 100644
+index eb241756eff..a08c682697f 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-@@ -143,4 +143,107 @@ QKmsDevice *QEglFSKmsGbmIntegration::createDevice()
-     return new QEglFSKmsGbmDevice(screenConfig(), path);
+@@ -150,4 +150,106 @@ QEglFSWindow *QEglFSKmsGbmIntegration::createWindow(QWindow *window) const
+     return new QEglFSKmsGbmWindow(window, this);
  }
  
 +int QEglFSKmsGbmIntegration::exportBuffer(const QScreen *screen, uint32_t width, uint32_t height,
@@ -821,7 +789,6 @@ index b6cdcf9..8339fe4 100644
 +        QEglFSKmsGbmScreen *gbmScreen = static_cast<QEglFSKmsGbmScreen *>(screen->handle());
 +        return (gbmScreen->removeOverlayBuffer(buf_id));
 +    }
-+
 +    return -1;
 +}
 +
@@ -905,13 +872,13 @@ index b6cdcf9..8339fe4 100644
 +
  QT_END_NAMESPACE
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-index 38f132d..ad11c6d 100644
+index 6467a21d93f..a842d5d0585 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-@@ -63,6 +63,19 @@ public:
- 
+@@ -67,6 +67,19 @@ public:
      QPlatformCursor *createCursor(QPlatformScreen *screen) const override;
      void presentBuffer(QPlatformSurface *surface) override;
+     QEglFSWindow *createWindow(QWindow *window) const override;
 +    int exportBuffer(const QScreen *screen, uint32_t width,
 +        uint32_t height, uint32_t pixel_format, uint32_t *strides,
 +        uint32_t *offsets, uint32_t buf_fd, uint32_t *buf_id) override;
@@ -929,7 +896,7 @@ index 38f132d..ad11c6d 100644
  protected:
      QKmsDevice *createDevice() override;
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-index 87fb314..87a4f09 100644
+index 1b52bdf3ec9..16be46973d0 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
 @@ -50,10 +50,25 @@
@@ -956,19 +923,21 @@ index 87fb314..87a4f09 100644
 +    QEglFSKmsGbmScreen *m_gbm_screen;
 +};
  
- void QEglFSKmsGbmScreen::bufferDestroyedHandler(gbm_bo *bo, void *data)
+ static inline uint32_t drmFormatToGbmFormat(uint32_t drmFormat)
  {
-@@ -96,11 +111,20 @@ QEglFSKmsGbmScreen::FrameBuffer *QEglFSKmsGbmScreen::framebufferForBufferObject(
+@@ -111,13 +126,22 @@ QEglFSKmsGbmScreen::FrameBuffer *QEglFSKmsGbmScreen::framebufferForBufferObject(
  
- QEglFSKmsGbmScreen::QEglFSKmsGbmScreen(QKmsDevice *device, const QKmsOutput &output)
-     : QEglFSKmsScreen(device, output)
+ QEglFSKmsGbmScreen::QEglFSKmsGbmScreen(QKmsDevice *device, const QKmsOutput &output, bool headless)
+     : QEglFSKmsScreen(device, output, headless)
 +    , m_qpa_flip_call(false)
 +    , m_user_flip_call(false)
 +    , m_start_flip_overlay_plane(false)
-     , m_gbm_surface(Q_NULLPTR)
-     , m_gbm_bo_current(Q_NULLPTR)
-     , m_gbm_bo_next(Q_NULLPTR)
-     , m_cursor(Q_NULLPTR)
+     , m_gbm_surface(nullptr)
+     , m_gbm_bo_current(nullptr)
+     , m_gbm_bo_next(nullptr)
+     , m_flipPending(false)
+     , m_cursor(nullptr)
+     , m_cloneSource(nullptr)
 +    , m_flip_primary_plane(false)
 +    , m_plane_id{0}
 +    , m_plane_idx(0)
@@ -979,7 +948,7 @@ index 87fb314..87a4f09 100644
  }
  
  QEglFSKmsGbmScreen::~QEglFSKmsGbmScreen()
-@@ -109,6 +133,100 @@ QEglFSKmsGbmScreen::~QEglFSKmsGbmScreen()
+@@ -126,6 +150,100 @@ QEglFSKmsGbmScreen::~QEglFSKmsGbmScreen()
      qCDebug(qLcEglfsKmsDebug, "Screen dtor. Remaining screens: %d", remainingScreenCount);
      if (!remainingScreenCount && !device()->screenConfig()->separateScreens())
          static_cast<QEglFSKmsGbmDevice *>(device())->destroyGlobalCursor();
@@ -1080,51 +1049,91 @@ index 87fb314..87a4f09 100644
  }
  
  QPlatformCursor *QEglFSKmsGbmScreen::cursor() const
-@@ -167,8 +285,10 @@ void QEglFSKmsGbmScreen::waitForFlip()
+@@ -251,14 +369,10 @@ void QEglFSKmsGbmScreen::waitForFlip()
          return;
  
      QMutexLocker lock(&m_waitForFlipMutex);
--    while (m_gbm_bo_next)
--        static_cast<QEglFSKmsGbmDevice *>(device())->handleDrmEvent();
+-    while (m_gbm_bo_next) {
+-        drmEventContext drmEvent;
+-        memset(&drmEvent, 0, sizeof(drmEvent));
+-        drmEvent.version = 2;
+-        drmEvent.vblank_handler = nullptr;
+-        drmEvent.page_flip_handler = pageFlipHandler;
+-        drmHandleEvent(device()->fd(), &drmEvent);
 +    while (m_gbm_bo_next){
 +        usleep(200);
-+    }
+     }
 +
  }
  
  void QEglFSKmsGbmScreen::flip()
-@@ -200,7 +320,7 @@ void QEglFSKmsGbmScreen::flip()
-                                  &op.modes[op.mode]);
- 
-         if (ret == -1) {
--            qErrnoWarning(errno, "Could not set DRM mode!");
-+            qErrnoWarning(errno, "Could not set DRM (%d) CRTC (%d) mode!", fd, op.crtc_id);
-         } else {
-             op.mode_set = true;
-             setPowerState(PowerStateOn);
-@@ -219,16 +339,10 @@ void QEglFSKmsGbmScreen::flip()
-         }
-     }
+@@ -287,22 +401,12 @@ void QEglFSKmsGbmScreen::flip()
+     FrameBuffer *fb = framebufferForBufferObject(m_gbm_bo_next);
+     ensureModeSet(fb->fb);
  
+-    QKmsOutput &op(output());
+-    const int fd = device()->fd();
+-    m_flipPending = true;
 -    int ret = drmModePageFlip(fd,
 -                              op.crtc_id,
 -                              fb->fb,
 -                              DRM_MODE_PAGE_FLIP_EVENT,
 -                              this);
 -    if (ret) {
--        qErrnoWarning("Could not queue DRM page flip!");
+-        qErrnoWarning("Could not queue DRM page flip on screen %s", qPrintable(name()));
+-        m_flipPending = false;
 -        gbm_surface_release_buffer(m_gbm_surface, m_gbm_bo_next);
--        m_gbm_bo_next = Q_NULLPTR;
+-        m_gbm_bo_next = nullptr;
+-        return;
 -    }
 +    m_primary_mutex.lock();
 +    m_primary_plane_fb = fb->fb;
 +    m_flip_primary_plane = true;
 +    m_primary_mutex.unlock();
+ 
++#if 0 // new code: handle this case later
+     for (CloneDestination &d : m_cloneDests) {
+         if (d.screen != this) {
+             d.screen->ensureModeSet(fb->fb);
+@@ -318,17 +422,7 @@ void QEglFSKmsGbmScreen::flip()
+             }
+         }
+     }
+-}
+-
+-void QEglFSKmsGbmScreen::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
+-{
+-    Q_UNUSED(fd);
+-    Q_UNUSED(sequence);
+-    Q_UNUSED(tv_sec);
+-    Q_UNUSED(tv_usec);
+-
+-    QEglFSKmsGbmScreen *screen = static_cast<QEglFSKmsGbmScreen *>(user_data);
+-    screen->flipFinished();
++#endif
  }
  
  void QEglFSKmsGbmScreen::flipFinished()
-@@ -241,4 +355,132 @@ void QEglFSKmsGbmScreen::flipFinished()
-     m_gbm_bo_next = Q_NULLPTR;
+@@ -338,7 +432,6 @@ void QEglFSKmsGbmScreen::flipFinished()
+         return;
+     }
+ 
+-    m_flipPending = false;
+     updateFlipStatus();
+ }
+ 
+@@ -357,9 +450,6 @@ void QEglFSKmsGbmScreen::updateFlipStatus()
+ {
+     Q_ASSERT(!m_cloneSource);
+ 
+-    if (m_flipPending)
+-        return;
+-
+     for (const CloneDestination &d : m_cloneDests) {
+         if (d.cloneFlipPending)
+             return;
+@@ -373,4 +463,132 @@ void QEglFSKmsGbmScreen::updateFlipStatus()
+     m_gbm_bo_next = nullptr;
  }
  
 +int QEglFSKmsGbmScreen::addOverlayBuffer(uint32_t width,
@@ -1257,7 +1266,7 @@ index 87fb314..87a4f09 100644
 +
  QT_END_NAMESPACE
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
-index 341cc95..7faf6a1 100644
+index b94f44b7b1e..ca9e7a4bbca 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.h
 @@ -44,12 +44,18 @@
@@ -1279,10 +1288,12 @@ index 341cc95..7faf6a1 100644
  
  class QEglFSKmsGbmScreen : public QEglFSKmsScreen
  {
-@@ -67,6 +73,30 @@ public:
-     void flip() override;
-     void flipFinished() override;
+@@ -68,19 +74,37 @@ public:
+     void waitForFlip() override;
  
+     void flip();
++    void flipFinished();
++
 +    int addOverlayBuffer(uint32_t width,
 +        uint32_t height,
 +        uint32_t pixel_format,
@@ -1306,12 +1317,24 @@ index 341cc95..7faf6a1 100644
 +    QMutex m_flip_mutex;
 +    QSemaphore m_flip_event;
 +    friend class DrmPageFlip;
-+
+ 
  private:
+-    void flipFinished();
+     void ensureModeSet(uint32_t fb);
+     void cloneDestFlipFinished(QEglFSKmsGbmScreen *cloneDestScreen);
+     void updateFlipStatus();
+ 
+-    static void pageFlipHandler(int fd,
+-                                unsigned int sequence,
+-                                unsigned int tv_sec,
+-                                unsigned int tv_usec,
+-                                void *user_data);
+-
      gbm_surface *m_gbm_surface;
  
-@@ -83,6 +113,15 @@ private:
-     FrameBuffer *framebufferForBufferObject(gbm_bo *bo);
+     gbm_bo *m_gbm_bo_current;
+@@ -103,6 +127,15 @@ private:
+     QVector<CloneDestination> m_cloneDests;
  
      static QMutex m_waitForFlipMutex;
 +
@@ -1327,5 +1350,5 @@ index 341cc95..7faf6a1 100644
  
  QT_END_NAMESPACE
 -- 
-1.9.1
+2.17.1
 
diff --git a/recipes-qt/qt5/qtbase/0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch b/recipes-qt/qt5/qtbase/0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch
deleted file mode 100644
index ef13f43..0000000
--- a/recipes-qt/qt5/qtbase/0001-qtbase-enhance-eglfs_kms-to-handle-DRM-plane-set-req.patch
+++ /dev/null
@@ -1,877 +0,0 @@
-From e4976c2623cc86981091ed6773613a1378039c3f Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 30 May 2017 16:48:22 -0400
-Subject: [PATCH] qtbase: enhance eglfs_kms to handle DRM plane set request 
- from application
-
-To take the full advantages of the hardware overlay features provided by
-the advanced DSS IP, the eglfs_kms QPA is modified to use DRM atomic
-mode set functions and handle the DRM plane set requests from the
-applications to synchronize the DRM page flip events.
-In this mode of operation, the QT still owns the primary (CRTC) DRM plane
-and the application may own the DRM overlay planes optionally.
-
-Upstream-Status: Inappropriate
-- This patch is not appropriate for upstream because it is a TI-specific enhancement
-for advanced DSS within some Sitera device such as AM57xx.
-- This patch may be dropped or re-implemented for the next QT release
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- .../eglfs_kms/qeglfskmsgbmdevice.cpp               | 233 ++++++++++++++++++++-
- .../eglfs_kms/qeglfskmsgbmdevice.h                 |  59 ++++++
- .../eglfs_kms/qeglfskmsgbmintegration.cpp          |  22 ++
- .../eglfs_kms/qeglfskmsgbmintegration.h            |   2 +
- .../eglfs_kms/qeglfskmsgbmscreen.cpp               |  84 +++++++-
- .../eglfs_kms_support/qeglfskmsdevice.cpp          | 131 +++++++++++-
- .../eglfs_kms_support/qeglfskmsscreen.h            |   2 +
- src/plugins/platforms/eglfs/eglfs_device_lib.pro   |   3 +-
- .../platforms/eglfs/qeglfsdeviceintegration.cpp    |  16 ++
- .../platforms/eglfs/qeglfsdeviceintegration.h      |   2 +
- src/plugins/platforms/eglfs/qeglfsintegration.cpp  |  21 +-
- 11 files changed, 558 insertions(+), 17 deletions(-)
-
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-index 278752b..0e851d9 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-@@ -52,8 +52,12 @@
- 
- QT_BEGIN_NAMESPACE
- 
-+#include <sys/time.h>
-+
- Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
- 
-+QMutex QEglFSKmsGbmDevice::m_pageFlipQueueMutex;
-+
- void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
- {
-     Q_UNUSED(fd);
-@@ -61,15 +65,52 @@ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned
-     Q_UNUSED(tv_sec);
-     Q_UNUSED(tv_usec);
- 
--    QEglFSKmsScreen *screen = static_cast<QEglFSKmsScreen *>(user_data);
--    screen->flipFinished();
-+    if(user_data == Q_NULLPTR)
-+    {
-+        // TBD: Error Handling
-+        qWarning() << "pageFlipHandler() is called with  user_data = NULL";
-+        return;
-+    }
-+
-+    QEglFSKmsGbmDevice *eglFSKmsGbmDevice = (QEglFSKmsGbmDevice *)user_data;
-+
-+    QQueue<drmPageFlipEvent_t*> *pageFlipEventQueue = eglFSKmsGbmDevice->pageFlipEventQueue();
-+
-+    if(pageFlipEventQueue == Q_NULLPTR)
-+    {
-+        qWarning() << "pageFlipHandler(): there is no pageFlipEventQueue";
-+        return;
-+    }
-+
-+    while(!pageFlipEventQueue->isEmpty())
-+    {
-+        drmPageFlipEvent_t *pageFlipEvent = pageFlipEventQueue->dequeue();
-+
-+        if(pageFlipEvent->handler)
-+            pageFlipEvent->handler(fd, sequence, tv_sec, tv_usec, pageFlipEvent->user_data);
-+        else if (pageFlipEvent->user_data)
-+        {
-+            QEglFSKmsGbmScreen *screen = static_cast<QEglFSKmsGbmScreen *>(pageFlipEvent->user_data);
-+            screen->flipFinished();
-+        }
-+        delete pageFlipEvent;
-+    }
-+
-+    delete pageFlipEventQueue;
-+
-+    eglFSKmsGbmDevice->pageFlipped(true);
-+
- }
- 
- QEglFSKmsGbmDevice::QEglFSKmsGbmDevice(QEglFSKmsIntegration *integration, const QString &path)
-     : QEglFSKmsDevice(integration, path)
-     , m_gbm_device(Q_NULLPTR)
-     , m_globalCursor(Q_NULLPTR)
-+    , m_pageFlipped(true)
- {
-+
-+    m_thread = new QEglFSKmsGbmThread((void *) this);
-+    m_pageFlipQueue = new QQueue<drmPageFlipReq_t*>;
- }
- 
- bool QEglFSKmsGbmDevice::open()
-@@ -94,26 +135,41 @@ bool QEglFSKmsGbmDevice::open()
-         return false;
-     }
- 
-+    drmSetClientCap(fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-+    drmSetClientCap(fd, DRM_CLIENT_CAP_ATOMIC, 1);
-     setFd(fd);
- 
-+    m_thread->start();
-+
-     return true;
- }
- 
- void QEglFSKmsGbmDevice::close()
- {
-+    // Terminate the device thread
-+    qWarning("QEglFSKmsGbmDevice::close(): Terminate device thread");
-+    m_thread->aborted(true);
-+    m_thread->wait();
-+    qWarning("QEglFSKmsGBmDevice::close(): Device thread terminated");
-+
-     if (m_gbm_device) {
-         gbm_device_destroy(m_gbm_device);
-         m_gbm_device = Q_NULLPTR;
-     }
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
-+
- }
- 
- EGLNativeDisplayType QEglFSKmsGbmDevice::nativeDisplay() const
-@@ -131,8 +187,46 @@ QPlatformCursor *QEglFSKmsGbmDevice::globalCursor() const
-     return m_globalCursor;
- }
- 
-+void QEglFSKmsGbmDevice::pageFlipped(bool value)
-+{
-+    m_pageFlipped = value;
-+}
-+
-+QQueue<drmPageFlipEvent_t*> *QEglFSKmsGbmDevice::pageFlipEventQueue() const
-+{
-+    return m_pageFlipEventQueue;
-+}
-+
-+
-+int QEglFSKmsGbmDevice::sendPageFlipRequest(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, page_flip_handler handler, void* user_data)
-+{
-+
-+    drmPageFlipReq_t *pageFlipReq = new drmPageFlipReq_t;
-+
-+    if(!pageFlipReq)
-+    {
-+        return -1;
-+    }
-+
-+    pageFlipReq->plane_id = plane_id;
-+    pageFlipReq->prop_fbid = prop_fbid;
-+    pageFlipReq->buffer_id = buffer_id;
-+    pageFlipReq->event.user_data = user_data;
-+    pageFlipReq->event.handler = handler;
-+
-+
-+    //TBD: Need to add mutex protection
-+    m_pageFlipQueueMutex.lock();
-+    m_pageFlipQueue->enqueue(pageFlipReq);
-+    m_pageFlipQueueMutex.unlock();
-+
-+    return 0;
-+}
-+
-+
- void QEglFSKmsGbmDevice::handleDrmEvent()
- {
-+#if 0
-     drmEventContext drmEvent = {
-         DRM_EVENT_CONTEXT_VERSION,
-         Q_NULLPTR,      // vblank handler
-@@ -140,6 +234,141 @@ void QEglFSKmsGbmDevice::handleDrmEvent()
-     };
- 
-     drmHandleEvent(fd(), &drmEvent);
-+#endif
-+}
-+
-+void QEglFSKmsGbmDevice::waitForEvent()
-+{
-+    drmEventContext event = {
-+        DRM_EVENT_CONTEXT_VERSION,
-+        Q_NULLPTR,      // vblank handler
-+        pageFlipHandler // page flip handler
-+    };
-+
-+    struct timeval timeout;
-+
-+	fd_set fds;
-+	int res;
-+
-+    // TBD: check pageFlipped sould be false
-+    m_pageFlipped = false;
-+    timeout.tv_sec = 0;
-+    timeout.tv_usec = 500 * 1000;
-+
-+	while (!m_pageFlipped)
-+	{
-+
-+		FD_ZERO(&fds);
-+		FD_SET(fd(), &fds);
-+
-+		res = select(fd() + 1, &fds, NULL, NULL, &timeout);
-+		switch (res)
-+		{
-+			case 0:
-+				qErrnoWarning("%s: Timeout waiting for flip event, call drmHandleEvent() manually", __func__);
-+				drmHandleEvent(fd(), &event);
-+				if(m_pageFlipped)
-+				{
-+					qErrnoWarning("%s: drmEvent does not occur, call pageFlipHandler() manually", __func__);
-+					pageFlipHandler(fd(), 0, 0, 0, (void *) this);
-+				}
-+				return;
-+			case -1:
-+				if (errno != EINTR)
-+				{
-+					qErrnoWarning("%s: Select failed waiting for flip event", __func__);
-+					return;
-+				}
-+				break;
-+			default:
-+				drmHandleEvent(fd(), &event);
-+				break;
-+		}
-+	}
-+}
-+
-+void QEglFSKmsGbmDevice::procPageFlipReq(void)
-+{
-+    bool err = false;
-+
-+    m_pageFlipQueueMutex.lock();
-+    if(m_pageFlipQueue->isEmpty())
-+    {
-+        m_pageFlipQueueMutex.unlock();
-+        return;
-+    }
-+
-+	drmModeAtomicReqPtr req = drmModeAtomicAlloc();
-+
-+    m_pageFlipEventQueue = new QQueue<drmPageFlipEvent_t*>;
-+
-+    //Mutex protection may be rquired
-+    while(!m_pageFlipQueue->isEmpty())
-+    {
-+        drmPageFlipReq_t* pageFlipReq = m_pageFlipQueue->dequeue();
-+        drmPageFlipEvent_t *pageFlipEvent = new drmPageFlipEvent_t;
-+
-+        drmModeAtomicAddProperty(req, pageFlipReq->plane_id,
-+                                 pageFlipReq->prop_fbid, pageFlipReq->buffer_id);
-+
-+        // Construct page flip callback
-+        pageFlipEvent->handler = pageFlipReq->event.handler;
-+        pageFlipEvent->user_data = pageFlipReq->event.user_data;
-+        m_pageFlipEventQueue->enqueue(pageFlipEvent);
-+
-+        delete pageFlipReq;
-+    }
-+    m_pageFlipQueueMutex.unlock();
-+
-+	int ret = drmModeAtomicCommit(fd(), req,
-+		  DRM_MODE_ATOMIC_TEST_ONLY, 0);
-+
-+	if(!ret){
-+	    drmModeAtomicCommit(fd(), req,
-+		    DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, (void *)this);
-+	}
-+    else {
-+		qErrnoWarning("procPageFlipReq(): failed to add crtc atomically");
-+
-+        // cleanup the event queue
-+        while(!m_pageFlipEventQueue->isEmpty())
-+        {
-+            drmPageFlipEvent_t *pageFlipEvent = m_pageFlipEventQueue->dequeue();
-+            delete pageFlipEvent;
-+        }
-+        delete m_pageFlipEventQueue;
-+        err = true;
-+	}
-+
-+	drmModeAtomicFree(req);
-+
-+    if(!err)
-+        waitForEvent();
-+
-+}
-+
-+QEglFSKmsGbmThread:: QEglFSKmsGbmThread(void* owner)
-+    : m_owner(owner)
-+    , m_aborted(false)
-+{
-+}
-+
-+void QEglFSKmsGbmThread::aborted(bool value)
-+{
-+    m_aborted = value;
-+}
-+
-+
-+void QEglFSKmsGbmThread::run() {
-+
-+    QEglFSKmsGbmDevice *eglKmsGbmDevice = (QEglFSKmsGbmDevice *)m_owner;
-+
-+    while(!m_aborted) {
-+        eglKmsGbmDevice->procPageFlipReq();
-+        msleep(2);
-+    }
-+
-+    //TBD: Add clean up code
- }
- 
- QEglFSKmsScreen *QEglFSKmsGbmDevice::createScreen(QEglFSKmsIntegration *integration, QEglFSKmsDevice *device, QEglFSKmsOutput output, QPoint position)
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-index 6a45f9f..acf4521 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.h
-@@ -45,8 +45,52 @@
- #include "qeglfskmsgbmcursor.h"
- #include "qeglfskmsdevice.h"
- 
-+#include <QtCore>
-+#include <QQueue>
-+
-+#include <xf86drm.h>
-+#include <xf86drmMode.h>
- #include <gbm.h>
- 
-+class QEglFSKmsGbmThread : public QThread
-+{
-+
-+public:
-+    QEglFSKmsGbmThread(void* owner);
-+    void aborted(bool);
-+
-+private:
-+    void* m_owner;
-+    bool m_aborted;
-+    void run();
-+};
-+
-+typedef void (*page_flip_handler)(int fd,
-+                                  unsigned int sequence,
-+                                  unsigned int tv_sec,
-+                                  unsigned int tv_usec,
-+                                  void *user_data);
-+
-+typedef struct drmPageFlipEvent_s
-+{
-+    void*    user_data;
-+    page_flip_handler   handler;
-+
-+} drmPageFlipEvent_t;
-+
-+typedef struct drmPageFlipReq_s
-+{
-+    //Plane page filp parameters
-+    uint32_t plane_id;
-+    uint32_t prop_fbid;
-+    uint32_t buffer_id;
-+
-+    //Page Flip Event parameters
-+    drmPageFlipEvent_t event;
-+
-+} drmPageFlipReq_t;
-+
-+
- QT_BEGIN_NAMESPACE
- 
- class QEglFSKmsScreen;
-@@ -71,18 +115,33 @@ public:
-                                           QEglFSKmsOutput output,
-                                           QPoint position) Q_DECL_OVERRIDE;
- 
-+    int  sendPageFlipRequest(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, page_flip_handler handler, void* user_data);
-+
-+    void procPageFlipReq(void);
-+
-+    void pageFlipped(bool);
-+
-+    QQueue<drmPageFlipEvent_t*> *pageFlipEventQueue() const;
-+
- private:
-     Q_DISABLE_COPY(QEglFSKmsGbmDevice)
- 
-     gbm_device *m_gbm_device;
- 
-     QEglFSKmsGbmCursor *m_globalCursor;
-+    bool m_pageFlipped;
-+    QEglFSKmsGbmThread *m_thread;
-+    QQueue<drmPageFlipReq_t*> *m_pageFlipQueue;
-+    QQueue<drmPageFlipEvent_t*> *m_pageFlipEventQueue;
-+    static QMutex m_pageFlipQueueMutex;
- 
-     static void pageFlipHandler(int fd,
-                                 unsigned int sequence,
-                                 unsigned int tv_sec,
-                                 unsigned int tv_usec,
-                                 void *user_data);
-+
-+    void waitForEvent(void);
- };
- 
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-index 1c0a8e1..d982289 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.cpp
-@@ -140,4 +140,26 @@ QEglFSKmsDevice *QEglFSKmsGbmIntegration::createDevice(const QString &devicePath
-     return new QEglFSKmsGbmDevice(this, path);
- }
- 
-+int QEglFSKmsGbmIntegration::drmFd() const
-+{
-+    if(device())
-+    {
-+        return device()->fd();
-+    }
-+    else
-+    {
-+        return 0;
-+    }
-+}
-+
-+int  QEglFSKmsGbmIntegration::sendPlaneSetRequest(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, void* handler, void* user_data)
-+{
-+    if(device())
-+    {
-+        return(static_cast<QEglFSKmsGbmDevice *>(device())->sendPageFlipRequest(plane_id, prop_fbid, buffer_id, (page_flip_handler)handler, user_data));
-+    }
-+
-+    return -1;
-+}
-+
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-index 727571d..28c7abb 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmintegration.h
-@@ -63,6 +63,8 @@ public:
- 
-     QPlatformCursor *createCursor(QPlatformScreen *screen) const Q_DECL_OVERRIDE;
-     void presentBuffer(QPlatformSurface *surface) Q_DECL_OVERRIDE;
-+    int  drmFd() const Q_DECL_OVERRIDE;
-+    int  sendPlaneSetRequest(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, void* handler, void* user_data) Q_DECL_OVERRIDE;
- 
- protected:
-     QEglFSKmsDevice *createDevice(const QString &devicePath) Q_DECL_OVERRIDE;
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-index 7a17b60..aa9f4af 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-@@ -166,9 +166,51 @@ void QEglFSKmsGbmScreen::waitForFlip()
-     while (m_gbm_bo_next)
-         static_cast<QEglFSKmsGbmDevice *>(device())->handleDrmEvent();
- }
-+
-+static int eglfskms_find_drm_prop_id(int fd, drmModeObjectPropertiesPtr props,
-+                                     const char *name, unsigned int *p_prop_id)
-+{
-+    drmModePropertyPtr p;
-+    unsigned int i, prop_id = 0; /* Property ID should always be > 0 */
-+
-+    for (i = 0; !prop_id && i < props->count_props; i++) {
-+        p = drmModeGetProperty(fd, props->props[i]);
-+        if (!strcmp(p->name, name)){
-+            prop_id = p->prop_id;
-+            break;
-+        }
-+        drmModeFreeProperty(p);
-+    }
-+    if (!prop_id) {
-+        qWarning("Could not find %s property\n", name);
-+        drmModeFreeObjectProperties(props);
-+        return(-1);
-+    }
-+
-+    *p_prop_id = prop_id;
-+    return 0;
-+}
-+
-+static void eglfskms_add_property(int fd, drmModeAtomicReqPtr req,
-+                                  drmModeObjectPropertiesPtr props,
-+                                  unsigned int plane_id,
-+                                  const char *name, int value)
-+{
-+    unsigned int prop_id;
-+    int ret;
-+    if(!eglfskms_find_drm_prop_id(fd, props, name, &prop_id))
-+    {
-+        if((ret = drmModeAtomicAddProperty(req, plane_id, prop_id, value)) < 0){
-+            qWarning("failed to add property with error code = %d\n", ret);
-+        }
-+    }
-+}
- 
- void QEglFSKmsGbmScreen::flip()
- {
-+
-+	drmModeObjectProperties *props;
-+
-     if (!m_gbm_surface) {
-         qWarning("Cannot sync before platform init!");
-         return;
-@@ -191,19 +233,47 @@ void QEglFSKmsGbmScreen::flip()
-                                  &output().modes[output().mode]);
- 
-         if (ret) {
--            qErrnoWarning("Could not set DRM mode!");
-+            qErrnoWarning("Could not set DRM (%d) CRTC (%d) mode!", device()->fd(), output().crtc_id);
-+            // Ignore page flip request if CRTC can not be configured
-+            gbm_surface_release_buffer(m_gbm_surface, m_gbm_bo_next);
-+            m_gbm_bo_next = Q_NULLPTR;
-+            return;
-         } else {
-+            // Plane setting
-+            int ret;
-+
-+            drmModeAtomicReqPtr req = drmModeAtomicAlloc();
-+            props = drmModeObjectGetProperties(device()->fd(), output().primary_plane_id,
-+                    DRM_MODE_OBJECT_PLANE);
-+
-+            eglfskms_add_property(device()->fd(), req, props, output().primary_plane_id, "FB_ID", fb->fb);
-+            eglfskms_add_property(device()->fd(), req, props, output().primary_plane_id, "CRTC_ID", output().crtc_id);
-+
-+            ret = drmModeAtomicCommit(device()->fd(), req,
-+                  DRM_MODE_ATOMIC_TEST_ONLY, 0);
-+
-+            if(!ret){
-+                drmModeAtomicCommit(device()->fd(), req, 0, 0);
-+            }
-+            else {
-+                qErrnoWarning("Failed to add PLANE (%d) parameters crtc_id = %d, fb_id = %d with err =%d:",
-+                               output().primary_plane_id,  output().crtc_id, fb->fb, ret);
-+
-+                //TBD: Error Handling
-+            }
-+
-+            drmModeFreeObjectProperties(props);
-+            drmModeAtomicFree(req);
-+
-             output().mode_set = true;
-             setPowerState(PowerStateOn);
-         }
-     }
- 
--    int ret = drmModePageFlip(device()->fd(),
--                              output().crtc_id,
--                              fb->fb,
--                              DRM_MODE_PAGE_FLIP_EVENT,
--                              this);
--    if (ret) {
-+    if(static_cast<QEglFSKmsGbmDevice *>(device())->sendPageFlipRequest(output().primary_plane_id,  output().plane_prop_fbid,
-+                                     fb->fb, Q_NULLPTR, this))
-+    {
-+        /* Error messgae */
-         qErrnoWarning("Could not queue DRM page flip!");
-         gbm_surface_release_buffer(m_gbm_surface, m_gbm_bo_next);
-         m_gbm_bo_next = Q_NULLPTR;
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp
-index f4ffee5..42bb714 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsdevice.cpp
-@@ -159,6 +159,118 @@ static bool parseModeline(const QByteArray &text, drmModeModeInfoPtr mode)
-     return true;
- }
- 
-+int eglfskms_get_drm_prop_val(int fd, drmModeObjectPropertiesPtr props,
-+							  const char *name, unsigned int *p_val)
-+{
-+	drmModePropertyPtr p;
-+	unsigned int i, prop_id = 0; /* Property ID should always be > 0 */
-+
-+	for (i = 0; !prop_id && i < props->count_props; i++) {
-+		p = drmModeGetProperty(fd, props->props[i]);
-+		if (!strcmp(p->name, name)){
-+			prop_id = p->prop_id;
-+			break;
-+		}
-+		drmModeFreeProperty(p);
-+	}
-+	if (!prop_id) {
-+		qWarning("Could not find %s property\n", name);
-+		drmModeFreeObjectProperties(props);
-+		return(-1);
-+	}
-+
-+	drmModeFreeProperty(p);
-+	*p_val = props->prop_values[i];
-+	return 0;
-+}
-+
-+int eglfskms_find_drm_prop_id(int fd, drmModeObjectPropertiesPtr props,
-+							  const char *name, unsigned int *p_prop_id)
-+{
-+	drmModePropertyPtr p;
-+	unsigned int i, prop_id = 0; /* Property ID should always be > 0 */
-+
-+	for (i = 0; !prop_id && i < props->count_props; i++) {
-+		p = drmModeGetProperty(fd, props->props[i]);
-+		if (!strcmp(p->name, name)){
-+			prop_id = p->prop_id;
-+			break;
-+		}
-+		drmModeFreeProperty(p);
-+	}
-+	if (!prop_id) {
-+		qWarning("Could not find %s property\n", name);
-+		drmModeFreeObjectProperties(props);
-+		return(-1);
-+	}
-+
-+    *p_prop_id = prop_id;
-+	return 0;
-+}
-+
-+
-+int drm_get_primary_plane_id(int fd, uint32_t crtc_id, unsigned int *p_plane_id, unsigned int *p_fbid)
-+{
-+	unsigned int i;
-+	drmModeObjectProperties *props;
-+	drmModePlaneRes *res = drmModeGetPlaneResources(fd);
-+	if(res == NULL){
-+		qWarning("plane resources not found\n");
-+        return -1;
-+	}
-+
-+	for (i = 0; i < res->count_planes; i++) {
-+		uint32_t plane_id = res->planes[i];
-+		unsigned int type_val;
-+
-+		drmModePlane *plane = drmModeGetPlane(fd, plane_id);
-+		if(plane == NULL){
-+			qWarning("plane not found\n");
-+            goto error_exit;
-+		}
-+
-+		props = drmModeObjectGetProperties(fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
-+
-+		if(props == NULL){
-+			qWarning("plane (%d) properties not found\n",  plane->plane_id);
-+            drmModeFreePlane(plane);
-+            goto error_exit;
-+		}
-+
-+		if(eglfskms_get_drm_prop_val(fd, props, "type",  &type_val) < 0)
-+        {
-+			qWarning("plane (%d) type value not found\n",  plane->plane_id);
-+		    drmModeFreeObjectProperties(props);
-+		    drmModeFreePlane(plane);
-+            goto error_exit;
-+        }
-+
-+		if(eglfskms_find_drm_prop_id(fd, props, "FB_ID",  p_fbid) < 0)
-+        {
-+			qWarning("plane (%d) FB ID not found\n",  plane->plane_id);
-+		    drmModeFreeObjectProperties(props);
-+		    drmModeFreePlane(plane);
-+            goto error_exit;
-+        }
-+
-+		drmModeFreeObjectProperties(props);
-+		drmModeFreePlane(plane);
-+
-+		if((type_val == DRM_PLANE_TYPE_PRIMARY) &&
-+           (plane->crtc_id == crtc_id) || (!plane->crtc_id)){
-+            plane->crtc_id = crtc_id;
-+			*p_plane_id = plane_id;
-+			drmModeFreePlaneResources(res);
-+			return 0;
-+		}
-+	}
-+
-+	qWarning("primary plane for crtc %d not found", crtc_id);
-+error_exit:
-+    drmModeFreePlaneResources(res);
-+	return -1;
-+}
-+
- QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, drmModeConnectorPtr connector, QPoint pos)
- {
-     const QByteArray connectorName = nameForConnector(connector);
-@@ -172,6 +284,7 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
-     OutputConfiguration configuration;
-     QSize configurationSize;
-     drmModeModeInfo configurationModeline;
-+    unsigned int plane_id, plane_fbid;
- 
-     const QByteArray mode = m_integration->outputSettings().value(QString::fromUtf8(connectorName))
-             .value(QStringLiteral("mode"), QStringLiteral("preferred")).toByteArray().toLower();
-@@ -268,14 +381,14 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
- 
-     int selected_mode = -1;
- 
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
- 
-     if (selected_mode < 0) {
-         qWarning() << "No modes available for output" << connectorName;
-@@ -287,6 +400,12 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
-         qCDebug(qLcEglfsKmsDebug) << "Selected mode" << selected_mode << ":" << width << "x" << height
-                                   << '@' << refresh << "hz for output" << connectorName;
-     }
-+
-+    if(drm_get_primary_plane_id(m_dri_fd, crtc_id, &plane_id, &plane_fbid) < 0)
-+    {
-+        return Q_NULLPTR;
-+    }
-+
-     static const int width = qEnvironmentVariableIntValue("QT_QPA_EGLFS_PHYSICAL_WIDTH");
-     static const int height = qEnvironmentVariableIntValue("QT_QPA_EGLFS_PHYSICAL_HEIGHT");
-     QSizeF size(width, height);
-@@ -304,7 +423,9 @@ QEglFSKmsScreen *QEglFSKmsDevice::screenForConnector(drmModeResPtr resources, dr
-         drmModeGetCrtc(m_dri_fd, crtc_id),
-         modes,
-         connector->subpixel,
--        connectorProperty(connector, QByteArrayLiteral("DPMS"))
-+        connectorProperty(connector, QByteArrayLiteral("DPMS")),
-+        plane_id,
-+        plane_fbid
-     };
- 
-     m_crtc_allocator |= (1 << output.crtc_id);
-diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h
-index aa698e1..fdb4dca 100644
---- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h
-+++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms_support/qeglfskmsscreen.h
-@@ -67,6 +67,8 @@ struct QEglFSKmsOutput
-     QList<drmModeModeInfo> modes;
-     int subpixel;
-     drmModePropertyPtr dpms_prop;
-+    uint32_t primary_plane_id;
-+    uint32_t plane_prop_fbid;
- };
- 
- class Q_EGLFS_EXPORT QEglFSKmsScreen : public QEglFSScreen
-diff --git a/src/plugins/platforms/eglfs/eglfs_device_lib.pro b/src/plugins/platforms/eglfs/eglfs_device_lib.pro
-index 974b85b..2ef797d 100644
---- a/src/plugins/platforms/eglfs/eglfs_device_lib.pro
-+++ b/src/plugins/platforms/eglfs/eglfs_device_lib.pro
-@@ -4,7 +4,8 @@
- # Hence this header-less, private-only module.
- 
- TARGET = QtEglDeviceIntegration
--CONFIG += no_module_headers internal_module
-+CONFIG += no_module_headers internal_module link_pkgconfig
-+PKGCONFIG += libdrm gbm
- 
- QT += core-private gui-private platformsupport-private
- LIBS += $$QMAKE_LIBS_DYNLOAD
-diff --git a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp
-index fc41dc5..6951540 100644
---- a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp
-+++ b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.cpp
-@@ -345,4 +345,20 @@ void *QEGLDeviceIntegration::wlDisplay() const
-     return Q_NULLPTR;
- }
- 
-+int QEGLDeviceIntegration::drmFd() const
-+{
-+    return 0;
-+}
-+
-+int QEGLDeviceIntegration::sendPlaneSetRequest(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, void* handler, void* user_data)
-+{
-+    Q_UNUSED(plane_id);
-+    Q_UNUSED(prop_fbid);
-+    Q_UNUSED(buffer_id);
-+    Q_UNUSED(handler);
-+    Q_UNUSED(user_data);
-+
-+    return -1;
-+}
-+
- QT_END_NAMESPACE
-diff --git a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h
-index f1a5bde..562f77f 100644
---- a/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h
-+++ b/src/plugins/platforms/eglfs/qeglfsdeviceintegration.h
-@@ -105,6 +105,8 @@ public:
-     virtual bool supportsSurfacelessContexts() const;
- 
-     virtual void *wlDisplay() const;
-+    virtual int drmFd() const;
-+    virtual int sendPlaneSetRequest(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, void* handler, void* user_data);
- };
- 
- class Q_EGLFS_EXPORT QEGLDeviceIntegrationPlugin : public QObject
-diff --git a/src/plugins/platforms/eglfs/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
-index 6f38a96..64c5c33 100644
---- a/src/plugins/platforms/eglfs/qeglfsintegration.cpp
-+++ b/src/plugins/platforms/eglfs/qeglfsintegration.cpp
-@@ -252,6 +252,12 @@ QPlatformNativeInterface *QEglFSIntegration::nativeInterface() const
-     return const_cast<QEglFSIntegration *>(this);
- }
- 
-+
-+static int qt_egl_device_send_drm_plane_set_req(uint32_t plane_id, uint32_t prop_fbid, uint32_t buffer_id, void* handler, void* user_data)
-+{
-+    return(qt_egl_device_integration()->sendPlaneSetRequest(plane_id, prop_fbid, buffer_id, handler, user_data));
-+}
-+
- enum ResourceType {
-     EglDisplay,
-     EglWindow,
-@@ -259,7 +265,9 @@ enum ResourceType {
-     EglConfig,
-     NativeDisplay,
-     XlibDisplay,
--    WaylandDisplay
-+    WaylandDisplay,
-+    DrmFd,
-+    DrmPlaneSetReq
- };
- 
- static int resourceType(const QByteArray &key)
-@@ -271,7 +279,9 @@ static int resourceType(const QByteArray &key)
-         QByteArrayLiteral("eglconfig"),
-         QByteArrayLiteral("nativedisplay"),
-         QByteArrayLiteral("display"),
--        QByteArrayLiteral("server_wl_display")
-+        QByteArrayLiteral("server_wl_display"),
-+        QByteArrayLiteral("drm_fd"),
-+        QByteArrayLiteral("drm_plane_set_req"),
-     };
-     const QByteArray *end = names + sizeof(names) / sizeof(names[0]);
-     const QByteArray *result = std::find(names, end, key);
-@@ -294,6 +304,13 @@ void *QEglFSIntegration::nativeResourceForIntegration(const QByteArray &resource
-     case WaylandDisplay:
-         result = qt_egl_device_integration()->wlDisplay();
-         break;
-+    case DrmFd:
-+        result = reinterpret_cast<void*>(qt_egl_device_integration()->drmFd());
-+        break;
-+    case DrmPlaneSetReq:
-+        result = reinterpret_cast<void*>(qt_egl_device_send_drm_plane_set_req);
-+        break;
-+
-     default:
-         break;
-     }
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
index e469528..7fe1fa2 100644
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk5.6"
+PR_append = ".tisdk5.7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -10,9 +10,9 @@ QT_NOSGX_PATCHES = "\
     file://quit.png \
 "
 
-#    file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
 SRC_URI += "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', '', "${QT_NOSGX_PATCHES}", d)}\
+    file://0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch \
 "
 
 python do_patch_append() {
-- 
2.17.1


