Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 12A6C52A40
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDwOZ054805
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139238;
	bh=LuOiLiWt2CphyStil0Jim/GDz/hE5by3gHhHbiXjKbk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=susQVhTdrs2RpOz+IZLYmaDAXklMaTrTIbg7AZkv2z3oR9IjSY7FLwBlJq6DrEqJV
	m63UBzV4nh6CwK2yc5WM7GWzgJ4d+AbGytXQ1N/ABerJUtRkmVpdEj54iqtudUHvVy
	tdK40cHhbRi48X5FiwYSG6cQDzITrmDhvogZ80DE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AIDwTO100678
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:58 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDuo1035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:29 -0400
Message-ID: <20190910181131.8808-8-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 7/9] HACK: libepoxy: replace local definitions with khrplatform.h at gen_dispatch
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:06 -0000
Content-Type: text/plain

The local definitions are not consistent with khrplatform.h. Replace them
with #include <KHR/khrplatform.h"

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...h-use-KHR-khrplatform.h-instead-of-l.patch | 50 +++++++++++++++++++
 .../libepoxy/libepoxy_1.5.2.bbappend          |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-graphics/libepoxy/libepoxy/0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch
 create mode 100644 recipes-graphics/libepoxy/libepoxy_1.5.2.bbappend

diff --git a/recipes-graphics/libepoxy/libepoxy/0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch b/recipes-graphics/libepoxy/libepoxy/0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch
new file mode 100644
index 0000000..08709b7
--- /dev/null
+++ b/recipes-graphics/libepoxy/libepoxy/0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch
@@ -0,0 +1,50 @@
+From 5f478733715e1a09b5040fe423e9238085875e8a Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Fri, 30 Aug 2019 18:06:15 -0400
+Subject: [PATCH] HACK: gen_dispatch: use <KHR/khrplatform.h> instead of local
+ definitions
+
+The common <KHR/khrplatform.h> should be used instead of local definitions
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ src/gen_dispatch.py | 13 +------------
+ 1 file changed, 1 insertion(+), 12 deletions(-)
+
+diff --git a/src/gen_dispatch.py b/src/gen_dispatch.py
+index 28dad2b..5458414 100755
+--- a/src/gen_dispatch.py
++++ b/src/gen_dispatch.py
+@@ -506,28 +506,17 @@ class Generator(object):
+             # don't directly include khrplatform.h because it's not
+             # present on many systems, and coming up with #ifdefs to
+             # decide when it's not present would be hard.
+-            self.outln('#define __khrplatform_h_ 1')
+             self.outln('typedef int8_t khronos_int8_t;')
+             self.outln('typedef int16_t khronos_int16_t;')
+-            self.outln('typedef int32_t khronos_int32_t;')
+-            self.outln('typedef int64_t khronos_int64_t;')
+             self.outln('typedef uint8_t khronos_uint8_t;')
+             self.outln('typedef uint16_t khronos_uint16_t;')
+-            self.outln('typedef uint32_t khronos_uint32_t;')
+-            self.outln('typedef uint64_t khronos_uint64_t;')
+             self.outln('typedef float khronos_float_t;')
+             self.outln('typedef long khronos_intptr_t;')
+             self.outln('typedef long khronos_ssize_t;')
+             self.outln('typedef unsigned long khronos_usize_t;')
+             self.outln('typedef uint64_t khronos_utime_nanoseconds_t;')
+             self.outln('typedef int64_t khronos_stime_nanoseconds_t;')
+-            self.outln('#define KHRONOS_MAX_ENUM 0x7FFFFFFF')
+-            self.outln('typedef enum {')
+-            self.outln('    KHRONOS_FALSE = 0,')
+-            self.outln('    KHRONOS_TRUE  = 1,')
+-            self.outln('    KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM')
+-            self.outln('} khronos_boolean_enum_t;')
+-            self.outln('typedef uintptr_t khronos_uintptr_t;')
++            self.outln('#include <KHR/khrplatform.h>')
+ 
+         if self.target == "glx":
+             self.outln('#include <X11/Xlib.h>')
+-- 
+2.17.1
+
diff --git a/recipes-graphics/libepoxy/libepoxy_1.5.2.bbappend b/recipes-graphics/libepoxy/libepoxy_1.5.2.bbappend
new file mode 100644
index 0000000..c4b82dc
--- /dev/null
+++ b/recipes-graphics/libepoxy/libepoxy_1.5.2.bbappend
@@ -0,0 +1,7 @@
+PR_append = ".tisdk0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+	file://0001-HACK-gen_dispatch-use-KHR-khrplatform.h-instead-of-l.patch \
+"
-- 
2.17.1


