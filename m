Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D783952987
	for <meta-arago@arago-project.org>;
	Sat,  9 Mar 2019 01:09:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2919Jau060059
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 19:09:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552093759;
	bh=51FHdQrqCdiTT+Yh00ngs0Ev3Zqxi5giRGG3ywQzGKw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NckREcPxfTs7eY6Qd+Yu1Lo3gCF1DCQtTvRih4eM97YzhpN0w2yO3mr94Z5xhucPK
	cy/7WOnP05ao2YvJNr+8zYlvXyBe5hQhIgz1zMjZgCIfIAyIhvKexQRArbpbs4wuVW
	Jsfnvqt/TAVRTvGwWE33Y5P8gcE/ld/N3bFbQI98=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2919JDV058600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 19:09:19 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 19:09:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 19:09:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2919JwP019293;
	Fri, 8 Mar 2019 19:09:19 -0600
Date: Fri, 8 Mar 2019 20:09:18 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <20190309010918.GB28041@beryl>
References: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
	<1552086127-40979-2-git-send-email-e-ruei1@ti.com>
	<20190308234846.GH26510@beryl>
	<b59f9ef7-e9be-3cc7-2f61-cf021da954cd@ti.com>
MIME-Version: 1.0
In-Reply-To: <b59f9ef7-e9be-3cc7-2f61-cf021da954cd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH 2/2] atbase-config: add eglfs_kms configuration file and change wl shell
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
X-List-Received-Date: Sat, 09 Mar 2019 01:09:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 08, 2019 at 07:16:47PM -0500, Ruei, Eric wrote:
> On 3/8/2019 6:48 PM, Denys Dmytriyenko wrote:
> >>[PATCH 2/2] atbase-config: add eglfs_kms configuration file and change wl shell
> >
> >atbase? typo?
> >
> >
> Should I change it to wayland?

I was merely pointing to a typo in the subject - atbase instead of qtbase

But if you think this should go to wayland-conf instead of qtbase-conf, it's 
ok, but I thought eglfs was Qt-specific feature...


> Eric
> 
> 
> >On Fri, Mar 08, 2019 at 06:02:07PM -0500, Eric Ruei wrote:
> >>- add eglfs_kms configuration file
> >>- switch to wl-shell because xdb-shell-v5 is obsolete
> >>
> >>Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>---
> >>  .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json         | 15 +++++++++++++++
> >>  meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh    |  3 ++-
> >>  .../recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh            |  3 ++-
> >>  meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb       | 10 +++++++---
> >>  4 files changed, 26 insertions(+), 5 deletions(-)
> >>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
> >>
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
> >>new file mode 100644
> >>index 0000000..61b834b
> >>--- /dev/null
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
> >>@@ -0,0 +1,15 @@
> >>+{
> >>+  "device": "/dev/dri/card0",
> >>+  "hwcursor": false,
> >>+  "pbuffers": true,
> >>+  "outputs": [
> >>+    {
> >>+      "name": "VGA1",
> >>+      "mode": "off"
> >>+    },
> >>+    {
> >>+      "name": "HDMI1",
> >>+      "mode": "1024x768"
> >>+    }
> >>+  ]
> >>+}
> >>\ No newline at end of file
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> >>index 9701a8e..2014d20 100644
> >>--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
> >>@@ -2,5 +2,6 @@
> >>  ### QT Environment Variables ###
> >>  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
> >>+export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
> >>  export QT_QPA_EGLFS_INTEGRATION=none
> >>-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
> >>+export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> >>index 68ccf04..8ff0508 100644
> >>--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> >>@@ -3,5 +3,6 @@
> >>  ### QT Environment Variables ###
> >>  export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
> >>  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
> >>+export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
> >>  export QT_QPA_EGLFS_INTEGRATION=none
> >>-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
> >>+export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
> >>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
> >>index b2ad0a8..5c2974e 100644
> >>--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
> >>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
> >>@@ -5,12 +5,16 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>-SRC_URI = "file://qt_env.sh"
> >>+SRC_URI = "file://qt_env.sh \
> >>+           file://eglfs_kms_cfg.json \
> >>+          "
> >>-# Add custom Arago qtbase Environment script file
> >>+# Add custom Arago qtbase Environment script and eglfs_kms configuration file
> >>  do_install () {
> >>      install -d ${D}${sysconfdir}/profile.d
> >>      install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
> >>+    install -d ${D}${sysconfdir}/qt5
> >>+    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
> >>  }
> >>-FILES_${PN} += "${sysconfdir}/profile.d/*"
> >>+FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

