Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 63E2952A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:11 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so998527oag.18
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uHTQMHLHDU4qXA9QsoLarXSOeQhEU9MLPyg84FFUTRo=;
	b=NJVwPuM5K13Rc33XYdQgX7G8nZOgBsyMkeRRgvC7BBNgcK68YpOO7+yijHSIxOS9Oe
	auB1hU7PsXVShksdJnQwdxE4ludBImrdw33G/odjMrdghZMo9XU5YONL7R8dPFgHWc9h
	SOzyHafVHm5uyR9ehPfgRwLZRu0DI1Fz6ZNoxnGfTZYdfjztxB3GoxbMOUUNXcykTAa2
	KVP2G3Xj+s9B00hsL0ihAV3xc9mk9o8wGH2S65HCMRZT1sLXiCulz0k+ZLqYPoeds0Yo
	hqAzl8D3fCqMQHFSlqq7r2jUhITQx+tzBMXs2yDdVt/iKcYuaeYWJh2Vhvqw8XMr9oKs
	Yj/w==
X-Received: by 10.60.11.67 with SMTP id o3mr11514006oeb.24.1359393970973;
	Mon, 28 Jan 2013 09:26:10 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.09
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:10 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:18 -0600
Message-Id: <1359393932-31361-18-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 18/32] wpa_supplicant: add a script for killing in case running
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:11 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a script which checks on whther the supplicant is running already
and kills it. It then launches the provided application.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wpa-supplicant/kill_wpa_supplicant.sh          |    9 +++++++++
 .../wpa-supplicant/wpa-supplicant_git.bb           |    6 ++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh
new file mode 100644
index 0000000..aab6474
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/kill_wpa_supplicant.sh
@@ -0,0 +1,9 @@
+#check if the wpa_suppicant is already running
+#if it does, stop it.
+StationRunning=`ps | grep -c wpa_supplicant`
+if [ $StationRunning -eq 2 ]; then
+        killall wpa_supplicant
+fi
+
+# start the application
+$*
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
index c471c4c..db32d4e 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant_git.bb
@@ -17,7 +17,7 @@ RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 DEFAULT_PREFERENCE = "-1"
 
 SRCREV = "ol_R5.SP3.05"
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
 PV = "2.0-devel-ti"
 
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/TI-OpenLink/hostap.git;protocol=git \
            file://defconfig \
            file://defaults-sane \
            file://wpa-supplicant.sh \
+           file://kill_wpa_supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
@@ -39,7 +40,7 @@ S = "${WORKDIR}/git/wpa_supplicant"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "/usr/sbin/wpa_passphrase"
 FILES_wpa-supplicant-cli = "/usr/sbin/wpa_cli"
-FILES_${PN} += " /usr/share/dbus-1/system-services/*"
+FILES_${PN} += " /usr/share/dbus-1/system-services/* /usr/sbin/kill_wpa_supplicant.sh"
 
 #we introduce MY_ARCH to get 'armv5te' as arch instead of the misleading 'arm' on armv5te builds
 MY_ARCH := "${PACKAGE_ARCH}"
@@ -54,6 +55,7 @@ do_install () {
 	install -m 755 wpa_supplicant ${D}${sbindir}
 	install -m 755 wpa_passphrase ${D}${sbindir}
 	install -m 755 wpa_cli        ${D}${sbindir}
+	install -m 755 ${WORKDIR}/kill_wpa_supplicant.sh ${D}${sbindir}
 
 	install -d ${D}${docdir}/wpa_supplicant
 	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
-- 
1.7.0.4


