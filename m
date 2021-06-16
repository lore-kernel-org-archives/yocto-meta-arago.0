Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 1511652B61
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 23:13:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15GNE9i4083487;
	Wed, 16 Jun 2021 18:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623885249;
	bh=RiOkkdMONlixBO9nm9VA4lLBuV3MCQaeNWbAoDG3CDA=;
	h=From:To:CC:Subject:Date;
	b=IMU9hNSczxPn4535uKmcu2dLwqoXFdfX+oGJf9bme/KLCHaTZF5sdsjakhns7+whP
	ZZEiiYcD+TW8AIwAz0dm2ODVYuTP+Vvwj5orYuy1EPSf+Z4eXkt6E4MuCFwblYG5wi
	/3y8PHiK5MHraWskImxUJCCM8797CNtSvPeNA3Lk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15GNE99Q110752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Jun 2021 18:14:09 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 16 Jun 2021 18:14:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 16 Jun 2021 18:14:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15GNE9Ua005930;
	Wed, 16 Jun 2021 18:14:09 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
Date: Wed, 16 Jun 2021 18:14:09 -0500
Message-ID: <20210616231409.14752-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell][PATCH] ltp-ddt:Update to 20210524
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
X-List-Received-Date: Wed, 16 Jun 2021 23:13:32 -0000
Content-Type: text/plain

Updated ltp to 20210524 on dunfell

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 31 +++++++++++++
 .../ltp/ltp/disable_hanging_tests.patch       | 45 +++++++++++++++++++
 .../ltp/ltp_20210524.bbappend                 | 27 +++++++++++
 ...tp-ddt_20200120.bb => ltp-ddt_20210524.bb} |  4 +-
 4 files changed, 105 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
 create mode 100644 meta-arago-distro/recipes-extended/ltp/ltp/disable_hanging_tests.patch
 create mode 100644 meta-arago-distro/recipes-extended/ltp/ltp_20210524.bbappend
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20200120.bb => ltp-ddt_20210524.bb} (94%)

diff --git a/meta-arago-distro/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-distro/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 00000000..e51950f1
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -0,0 +1,31 @@
+From 93772c511d954d755cc9128c58ed8968a5af541b Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index 481d39691..cf207d10e 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
+ 
+ cpuset01 cpuset01
+ 
+-oom01 oom01
+-oom02 oom02
+-oom03 oom03
+-oom04 oom04
+-oom05 oom05
+-
+ swapping01 swapping01 -i 5
+ 
+ thp01 thp01 -I 120
diff --git a/meta-arago-distro/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta-arago-distro/recipes-extended/ltp/ltp/disable_hanging_tests.patch
new file mode 100644
index 00000000..113ac0fe
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ltp/ltp/disable_hanging_tests.patch
@@ -0,0 +1,45 @@
+This patch disables tests which we've found "hang" on our infrastructure.
+
+cgroup_xattr:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1926 (x86)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1898 (x86)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1916 (x86)
+
+proc01:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
+(in the latter was trying to read /proc/kmsg)
+(the above test looks horrible anyway)
+
+Upstream-Status: Inappropriate [OE Configuration]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/runtest/controllers
+===================================================================
+--- git.orig/runtest/controllers
++++ git/runtest/controllers
+@@ -352,8 +352,6 @@ cpuset_memory_spread	cpuset_memory_sprea
+ 
+ cpuset_regression_test cpuset_regression_test.sh
+ 
+-cgroup_xattr	cgroup_xattr
+-
+ pids_1_1 pids.sh 1 1 0
+ pids_1_2 pids.sh 1 2 0
+ pids_1_10 pids.sh 1 10 0
+Index: git/runtest/fs
+===================================================================
+--- git.orig/runtest/fs
++++ git/runtest/fs
+@@ -64,11 +64,6 @@ writetest01	writetest
+ #Also run the fs_di (Data Integrity tests)
+ fs_di fs_di -d $TMPDIR
+ 
+-# Read every file in /proc. Not likely to crash, but does enough
+-# to disturb the kernel. A good kernel latency killer too.
+-# Was not sure why it should reside in runtest/crashme and won't get tested ever
+-proc01 proc01 -m 128
+-
+ read_all_dev read_all -d /dev -p -q -r 3
+ read_all_proc read_all -d /proc -q -r 3
+ read_all_sys read_all -d /sys -q -r 3
diff --git a/meta-arago-distro/recipes-extended/ltp/ltp_20210524.bbappend b/meta-arago-distro/recipes-extended/ltp/ltp_20210524.bbappend
new file mode 100644
index 00000000..bfe4ddb0
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/ltp/ltp_20210524.bbappend
@@ -0,0 +1,27 @@
+SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
+
+SRC_URI = "git://github.com/linux-test-project/ltp.git \
+           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://disable_hanging_tests.patch \
+           "
+remove_broken_musl_sources() {
+	[ "${TCLIBC}" = "musl" ] || return 0
+
+	cd ${S}
+	echo "WARNING: remove unsupported tests (until they're fixed)"
+
+	# sync with upstream
+	# https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L33
+	rm -rfv \
+		testcases/kernel/sched/process_stress/process.c \
+		testcases/kernel/syscalls/confstr/confstr01.c \
+		testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
+		testcases/kernel/syscalls/getcontext/getcontext01.c \
+		testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
+		testcases/kernel/syscalls/timer_create/timer_create01.c \
+		testcases/kernel/syscalls/timer_create/timer_create03.c \
+		utils/benchmark/ebizzy-0.3
+}
+do_patch[postfuncs] += "remove_broken_musl_sources"
+
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
similarity index 94%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index 67ec1d74..cb4c7944 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -10,10 +10,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r13"
+PR = "r1"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "31f9cfa61ae4102da6fa87f624130096c09d63a2"
+SRCREV = "21b2b2e3ce3d30a685cd64c05cfd5920eca9be21"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.17.1


