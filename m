Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C24385298A
	for <meta-arago@arago-project.org>;
	Wed, 26 Dec 2018 18:35:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBQIZ2AX095653
	for <meta-arago@arago-project.org>; Wed, 26 Dec 2018 12:35:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545849302;
	bh=rCGsGFehJXNTcEXpVqtB78XpKCvh2sz/M6Vk8ay6/0I=;
	h=From:To:Subject:Date;
	b=HOYwl3nEJ6krqYSEDOTByBUqq/CabIuUy/gTJuwbNV/AKCVmotHm8I+eyu2bytHs0
	HXA8Oy26Qs/TISU3znH89++wviy6Nn43DZ20WOMZMXzbbDmLnwfmK8//H3fI2wVZcm
	LdpXWCrjoO8P88bIE4QdUcg5iiIHkZNgssle8LO4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBQIZ2Hq103811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 26 Dec 2018 12:35:02 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 26 Dec 2018 12:35:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 26 Dec 2018 12:35:02 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBQIZ1UD010427
	for <meta-arago@arago-project.org>; Wed, 26 Dec 2018 12:35:02 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Dec 2018 13:34:58 -0500
Message-ID: <1545849298-59895-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] qtbase: update eglfs_kms patch to fix exit lockup issue
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
X-List-Received-Date: Wed, 26 Dec 2018 18:35:15 -0000
Content-Type: text/plain

This patch addresses the qApp->quit() lockup issue. The drmHandleEvent()
should be called only if there is DRM event ready to be processed.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...nhance-the-QPA-for-multiple-display-and-u.patch | 107 +++++++++++++--------
 recipes-qt/qt5/qtbase_%.bbappend                   |   2 +-
 2 files changed, 69 insertions(+), 40 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch b/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
index 155747f..ec8b183 100644
--- a/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
+++ b/recipes-qt/qt5/qtbase/0001-eglfs_kms-enhance-the-QPA-for-multiple-display-and-u.patch
@@ -1,6 +1,6 @@
-From f383ddedeb19e87d987b4146a20b7c9e7ea2808e Mon Sep 17 00:00:00 2001
+From e1dee76a81fb16966ecf1f09c2a7c6fbcfb63bb9 Mon Sep 17 00:00:00 2001
 From: Manisha Agrawal <manisha.agrawal@ti.com>
-Date: Fri, 18 May 2018 09:23:31 -0400
+Date: Wed, 26 Dec 2018 10:50:14 -0500
 Subject: [PATCH] eglfs_kms: enhance the QPA for multiple display and user
  buffer
 
@@ -26,14 +26,14 @@ Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
  src/platformsupport/kmsconvenience/qkmsdevice_p.h  |  14 +-
  .../eglfs/api/qeglfsdeviceintegration.cpp          |  87 +++++++
  .../eglfs/api/qeglfsdeviceintegration_p.h          |  14 ++
- .../platforms/eglfs/api/qeglfsintegration.cpp      | 106 +++++++-
- .../eglfs_kms/qeglfskmsgbmdevice.cpp               |  63 +++--
+ .../platforms/eglfs/api/qeglfsintegration.cpp      | 104 +++++++-
+ .../eglfs_kms/qeglfskmsgbmdevice.cpp               |  97 ++++++--
  .../eglfs_kms/qeglfskmsgbmdevice.h                 |  16 +-
  .../eglfs_kms/qeglfskmsgbmintegration.cpp          | 103 ++++++++
  .../eglfs_kms/qeglfskmsgbmintegration.h            |  13 +
- .../eglfs_kms/qeglfskmsgbmscreen.cpp               | 270 +++++++++++++++++++--
+ .../eglfs_kms/qeglfskmsgbmscreen.cpp               | 268 ++++++++++++++++++++-
  .../eglfs_kms/qeglfskmsgbmscreen.h                 |  39 +++
- 11 files changed, 886 insertions(+), 47 deletions(-)
+ 11 files changed, 918 insertions(+), 45 deletions(-)
 
 diff --git a/src/platformsupport/kmsconvenience/qkmsdevice.cpp b/src/platformsupport/kmsconvenience/qkmsdevice.cpp
 index a8eefe6..a6478ed 100644
@@ -467,16 +467,14 @@ index 4335554..b3d8fa0 100644
  
  class Q_EGLFS_EXPORT QEglFSDeviceIntegrationPlugin : public QObject
 diff --git a/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp b/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
-index 9a0be48..3bc4111 100644
+index 9a0be48..81a1848 100644
 --- a/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
 +++ b/src/plugins/platforms/eglfs/api/qeglfsintegration.cpp
-@@ -286,8 +286,17 @@ enum ResourceType {
-     EglConfig,
+@@ -287,7 +287,16 @@ enum ResourceType {
      NativeDisplay,
      XlibDisplay,
--    WaylandDisplay,
+     WaylandDisplay,
 -    EglSurface
-+    WaylandDisplay,
 +    EglSurface,
 +    ExportBuffer,
 +    DistroyBuffer,
@@ -605,20 +603,21 @@ index 9a0be48..3bc4111 100644
          break;
      }
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-index e218d58..9948ef7 100644
+index e218d58..2a1b4b4 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
-@@ -45,7 +45,8 @@
- #include "qeglfsintegration_p.h"
+@@ -46,6 +46,10 @@
  
  #include <QtCore/QLoggingCategory>
--#include <QtCore/private/qcore_unix_p.h>
-+#include <QtCore/private/qcore_unix_p.h>
-+#include <QThread>
+ #include <QtCore/private/qcore_unix_p.h>
++#include <QThread>
++
++#include <sys/select.h>
++
  
  #define ARRAY_LENGTH(a) (sizeof (a) / sizeof (a)[0])
  
-@@ -53,6 +54,31 @@ QT_BEGIN_NAMESPACE
+@@ -53,6 +57,62 @@ QT_BEGIN_NAMESPACE
  
  Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
  
@@ -640,17 +639,48 @@ index e218d58..9948ef7 100644
 +        DRM_EVENT_CONTEXT_VERSION,
 +        Q_NULLPTR,      // vblank handler
 +        QEglFSKmsGbmDevice::pageFlipHandler // page flip handler
-+    };
-+
-+    while(m_abort == false){
-+        drmHandleEvent(m_gbm_device->fd(), &drmEvent);
-+    }
++    };
++
++	struct timeval timeout = {
++		.tv_sec = 0,
++		.tv_usec = 5 * 1000  /* 5ms polling for dRM events */
++	};
++
++	fd_set fds;
++	int res;
++
++	while(m_abort == false){
++
++		FD_ZERO(&fds);
++		FD_SET(m_gbm_device->fd(), &fds);
++
++		res = select(m_gbm_device->fd() + 1, &fds, NULL, NULL, &timeout);
++
++		switch (res)
++		{
++			case 0:
++				/* timeout occurs */
++				break;
++
++			case -1:
++				if (errno != EINTR)
++				{
++					qErrnoWarning("%s: Select failed waiting for flip event: %d",
++								__func__, errno);
++				}
++				break;
++
++			default:
++				drmHandleEvent(m_gbm_device->fd(), &drmEvent);
++				break;
++		}
++	}
 +}
 +
  void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned int tv_sec, unsigned int tv_usec, void *user_data)
  {
      Q_UNUSED(fd);
-@@ -60,8 +86,17 @@ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned
+@@ -60,8 +120,17 @@ void QEglFSKmsGbmDevice::pageFlipHandler(int fd, unsigned int sequence, unsigned
      Q_UNUSED(tv_sec);
      Q_UNUSED(tv_usec);
  
@@ -670,7 +700,7 @@ index e218d58..9948ef7 100644
  }
  
  QEglFSKmsGbmDevice::QEglFSKmsGbmDevice(QKmsScreenConfig *screenConfig, const QString &path)
-@@ -92,8 +127,12 @@ bool QEglFSKmsGbmDevice::open()
+@@ -92,8 +161,12 @@ bool QEglFSKmsGbmDevice::open()
          return false;
      }
  
@@ -683,24 +713,25 @@ index e218d58..9948ef7 100644
      return true;
  }
  
-@@ -105,9 +144,16 @@ void QEglFSKmsGbmDevice::close()
+@@ -104,9 +177,16 @@ void QEglFSKmsGbmDevice::close()
+     if (m_gbm_device) {
          gbm_device_destroy(m_gbm_device);
          m_gbm_device = Q_NULLPTR;
-     }
+-    }
++    }
++
 +    m_drm_page_flip_handler->m_abort = true;
 +    m_drm_page_flip_handler->wait();
 +    delete m_drm_page_flip_handler;
-+    m_drm_page_flip_handler = 0;
++    m_drm_page_flip_handler = 0;
  
      if (fd() != -1) {
 +        drmSetClientCap(fd(), DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 +        drmSetClientCap(fd(), DRM_CLIENT_CAP_ATOMIC, 0);
          qt_safe_close(fd());
-+        qWarning("QEglFSKmsGBmDevice::close(): close DRM %d", fd());
          setFd(-1);
      }
- }
-@@ -138,17 +184,6 @@ void QEglFSKmsGbmDevice::destroyGlobalCursor()
+@@ -138,17 +218,6 @@ void QEglFSKmsGbmDevice::destroyGlobalCursor()
      }
  }
  
@@ -898,15 +929,13 @@ index 38f132d..ad11c6d 100644
  protected:
      QKmsDevice *createDevice() override;
 diff --git a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-index 87fb314..f498bf1 100644
+index 87fb314..87a4f09 100644
 --- a/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
 +++ b/src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmscreen.cpp
-@@ -49,11 +49,26 @@
- #include <QtGui/private/qguiapplication_p.h>
+@@ -50,10 +50,25 @@
  #include <QtFbSupport/private/qfbvthandler_p.h>
  
--#include <errno.h>
-+#include <errno.h>
+ #include <errno.h>
 +#include <QThread>
 +#include <QMutex>
 +#include <string.h>
@@ -935,7 +964,7 @@ index 87fb314..f498bf1 100644
      : QEglFSKmsScreen(device, output)
 +    , m_qpa_flip_call(false)
 +    , m_user_flip_call(false)
-+	, m_start_flip_overlay_plane(false)
++    , m_start_flip_overlay_plane(false)
      , m_gbm_surface(Q_NULLPTR)
      , m_gbm_bo_current(Q_NULLPTR)
      , m_gbm_bo_next(Q_NULLPTR)
@@ -1018,8 +1047,8 @@ index 87fb314..f498bf1 100644
 +                }
 +
 +                drmModeAtomicCommit(m_gbm_screen->device()->fd(), req,
-+                    DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, m_gbm_screen);
-+
++                    DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, m_gbm_screen);
++
 +                //sleeping for 5 msec, assuming that display is not running at more than 120 fps
 +                msleep(5);
 +                while(m_gbm_screen->m_flip_event.tryAcquire(1) == false) {
diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
index 57f5553..a5f6d97 100644
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk5.3"
+PR_append = ".tisdk5.4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


