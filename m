Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id DAC8A52993
	for <meta-arago@arago-project.org>;
	Wed, 20 Jan 2016 02:36:33 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O18002EICKC6SS0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 19 Jan 2016 20:36:18 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=QyXUC8HyAAAA:8 a=D31QgfloAAAA:8	a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
	a=e5mUnYsNAAAA:8 a=vlf6L3127E15xcbZ8ugA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7014A161E01;	Tue,
	19 Jan 2016 21:36:12 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 19 Jan 2016 21:36:08 -0500
Message-id: <1453257370-3024-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/3] libinput: update to 1.1.4
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
X-List-Received-Date: Wed, 20 Jan 2016 02:36:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ics-need-to-fake-new-touches-on-TRIPLETAP.patch | 72 ++++++++++++++++++++++
 .../recipes-graphics/wayland/libinput_0.6.0.bb     | 14 -----
 .../recipes-graphics/wayland/libinput_1.1.4.bb     | 23 +++++++
 3 files changed, 95 insertions(+), 14 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
 delete mode 100644 meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb

diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch b/meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
new file mode 100644
index 0000000..97c63bd
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/libinput/touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch
@@ -0,0 +1,72 @@
+This is a workaround upstream suggests for use with kernel 4.1.
+
+Upstream-Status: Inappropriate [temporary work-around]
+Signed-Off-By: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon Aug 3 18:23:12 PDT 2015
+Subject: [PATCH v3 libinput] touchpad: serial synaptics need to fake new touches on TRIPLETAP
+
+On the 4.1 kernels synaptics pretends to have 3 slots (the serial fw only does
+2). This was added to avoid cursor jumps but has since been reverted for 4.2
+(kernel commit dbf3c37086, 4.1.3 is still buggy). In some cases a TRIPLETAP
+may be triggered without slot 2 ever activating.
+
+While there are still those kernels out there, work around this bug by opening
+a new touch point where none exists if the fake finger count exceeds the slot
+count.
+
+Reported-by: Jan Alexander Steffens <jan.steffens at gmail.com>
+Signed-off-by: Peter Hutterer <peter.hutterer at who-t.net>
+Tested-by: Jan Alexander Steffens <jan.steffens at gmail.com>
+Reviewed-by: Hans de Goede <hdegoede at redhat.com>
+---
+Changes to v2:
+- split out the handling instead of having a tmp state variable, see Hans'
+  comments from v2
+
+Mainly sending this to the list again so I have a link to point people to.
+If you're on 4.1.x add this patch to your distribution package.
+
+ src/evdev-mt-touchpad.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/evdev-mt-touchpad.c b/src/evdev-mt-touchpad.c
+index a683d9a..5ef03d5 100644
+--- a/src/evdev-mt-touchpad.c
++++ b/src/evdev-mt-touchpad.c
+@@ -369,13 +369,23 @@ tp_restore_synaptics_touches(struct tp_dispatch *tp,
+ 	for (i = 0; i < tp->num_slots; i++) {
+ 		struct tp_touch *t = tp_get_touch(tp, i);
+ 
+-		if (t->state != TOUCH_END)
++		switch(t->state) {
++		case TOUCH_HOVERING:
++		case TOUCH_BEGIN:
++		case TOUCH_UPDATE:
+ 			continue;
+-
+-		/* new touch, move it through begin to update immediately */
+-		tp_new_touch(tp, t, time);
+-		tp_begin_touch(tp, t, time);
+-		t->state = TOUCH_UPDATE;
++		case TOUCH_NONE:
++			/* new touch, move it through to begin immediately */
++			tp_new_touch(tp, t, time);
++			tp_begin_touch(tp, t, time);
++			break;
++		case TOUCH_END:
++			/* touch just ended ,we need need to restore it to update */
++			tp_new_touch(tp, t, time);
++			tp_begin_touch(tp, t, time);
++			t->state = TOUCH_UPDATE;
++			break;
++		}
+ 	}
+ }
+ 
+-- 
+2.4.3
+
diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
deleted file mode 100644
index c3bbb7b..0000000
--- a/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Library to handle input devices in Wayland compositors"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
-
-DEPENDS = "libevdev udev mtdev"
-
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
-SRC_URI[sha256sum] = "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bfbc"
-
-inherit autotools pkgconfig
diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb
new file mode 100644
index 0000000..635b36a
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/libinput_1.1.4.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Library to handle input devices in Wayland compositors"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
+
+DEPENDS = "libevdev udev mtdev"
+
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
+"
+SRC_URI[md5sum] = "0945318141c1a9f52857bbf65d175f32"
+SRC_URI[sha256sum] = "302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5fab5b6"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
+
+FILES_${PN} += "${libdir}/udev/"
+FILES_${PN}-dbg += "${libdir}/udev/.debug"
-- 
2.2.0


