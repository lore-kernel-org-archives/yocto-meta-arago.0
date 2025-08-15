Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF079CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 19:32:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.19938.1755286327632388048
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 12:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bsIi15wO;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FJW5LP2668543;
	Fri, 15 Aug 2025 14:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755286325;
	bh=42tEwyqgdvq51TVMvpYykve+KuNapPCPSxYaxNlVnvY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bsIi15wOwDGH+VD3TV4m5cV3wyLK6BMNIGUgM1nUgbGy30BxRN6RcsYCr3w31vDMv
	 BHbilufvXowBPgfKFsLGTxgMAR2ikbN01og0mKxqZL7Luqx0Vk8K51ljNL7eQ7K7eg
	 X5EcnV0ESM+8Naat5BG+xQbTXIjKgiZt1zKTZppE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FJW5Fg2803854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 14:32:05 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 14:32:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 14:32:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FJW4od1745525;
	Fri, 15 Aug 2025 14:32:04 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <a-christidis@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 2/2] piglit: use TestPlaceholder to reduce memory usage
Date: Fri, 15 Aug 2025 14:31:56 -0500
Message-ID: <20250815193156.1982216-3-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815193156.1982216-1-rs@ti.com>
References: <20250815193156.1982216-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 19:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16479

From: Randolph Sapp <rs@ti.com>

Backport the patch that uses TestPlaceholder objects to reduce memory
usage and increase test execution speeds when using subsets of the deqp
test suites.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/piglit/piglit-ti.inc     |   2 +
 ...-add-and-use-TestPlaceholder-objects.patch | 129 ++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch

diff --git a/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc b/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
index 73df681e..707ef6a4 100644
--- a/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
+++ b/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
@@ -3,6 +3,8 @@
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/piglit:"
 
+SRC_URI += "file://0001-framework-add-and-use-TestPlaceholder-objects.patch"
+
 PACKAGECONFIG[deqp-gles] = ",,,opengl-es-cts"
 PACKAGECONFIG[deqp-vk] = ",,,vulkan-cts"
 
diff --git a/meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch b/meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch
new file mode 100644
index 00000000..e7de2a39
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/piglit/piglit/0001-framework-add-and-use-TestPlaceholder-objects.patch
@@ -0,0 +1,129 @@
+From 2803263ccf460ced705fd4da589e2f09e3ec89d7 Mon Sep 17 00:00:00 2001
+From: Randolph Sapp <rs@ti.com>
+Date: Wed, 13 Aug 2025 17:52:42 -0500
+Subject: [PATCH] framework: add and use TestPlaceholder objects
+
+The actual Test classes are not that big, but with deqp-vk creating
+around 2800 instances currently, we quickly consume around 3GB of ram
+before beginning any tests. Given that a lot of these objects may not
+even be used, we can reduce memory overhead by using a placeholder
+namedtuple that is expanded to a full Test instance when requested from
+the TestDict class. This cuts the initial memory usage back to 1.6 GB.
+
+This does add a small lookup penalty, but given the lookup penalty is
+still smaller that the time it takes to create an instance of a Test, it
+results in a net improvement for most subsets of deqp tests. Not to
+mention this penalty can be split between threads, unlike previously
+when it was occurring in the single-threadded profile creation step.
+
+The following data was collected using a subset of 3151 deqp-vk tests:
+
+Threads   Test Execution Time (s)   TestPlaceholder Execution Time (s)
+-------   -----------------------   ----------------------------------
+1         2613.93                   2599.95
+8          413.31                    400.01
+32         299.75                    286.73
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1032]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ framework/profile.py   | 23 ++++++++++++++++++-----
+ framework/test/base.py |  3 +++
+ framework/test/deqp.py |  4 ++--
+ 3 files changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/framework/profile.py b/framework/profile.py
+index 678e9d87c..969e0032e 100644
+--- a/framework/profile.py
++++ b/framework/profile.py
+@@ -45,7 +45,7 @@ from framework import grouptools, exceptions, status
+ from framework.dmesg import get_dmesg
+ from framework.log import LogManager
+ from framework.monitoring import Monitoring
+-from framework.test.base import Test, DummyTest
++from framework.test.base import Test, DummyTest, TestPlaceholder
+ from framework.test.piglit_test import (
+     PiglitCLTest, PiglitGLTest, ASMParserTest, BuiltInConstantsTest,
+     CLProgramTester, VkRunnerTest, ROOT_DIR,
+@@ -135,9 +135,9 @@ class TestDict(collections.abc.MutableMapping):
+                 "TestDict keys must be strings, but was {}".format(type(key)))
+ 
+         # Values should either be more Tests
+-        if not isinstance(value, Test):
++        if not (isinstance(value, Test) or isinstance(value, TestPlaceholder)):
+             raise exceptions.PiglitFatalError(
+-                "TestDict values must be a Test, but was a {}".format(
++                "TestDict values must be a Test or TestPlaceholder, but was a {}".format(
+                     type(value)))
+ 
+         # This must be lowered before the following test, or the test can pass
+@@ -164,8 +164,21 @@ class TestDict(collections.abc.MutableMapping):
+         self.__container[key] = value
+ 
+     def __getitem__(self, key):
+-        """Lower the value before returning."""
+-        return self.__container[key.lower()]
++        """Lower the value before returning. Remove placeholders as needed."""
++        item = self.__container[key.lower()]
++        if isinstance(item, TestPlaceholder):
++            try:
++                real_item = item.test_class(item.test_name)
++            except TypeError:
++                raise exceptions.PiglitFatalError(
++                    "Unable to expand the TestPlaceholder for the class: {}\n"
++                    "This was associated with the following key: {}".format(
++                        type(item), key
++                    )
++                )
++            self.__container[key.lower()] = real_item
++            return real_item
++        return item
+ 
+     def __delitem__(self, key):
+         """Lower the value before returning."""
+diff --git a/framework/test/base.py b/framework/test/base.py
+index 430064b9b..0efa38336 100644
+--- a/framework/test/base.py
++++ b/framework/test/base.py
+@@ -24,6 +24,7 @@
+ """ Module provides a base class for Tests """
+ 
+ import abc
++import collections
+ import copy
+ import errno
+ import itertools
+@@ -97,6 +98,8 @@ def is_crash_returncode(returncode):
+         return returncode < 0
+ 
+ 
++TestPlaceholder = collections.namedtuple('TestPlaceholder', ['test_class', 'test_name'])
++
+ class Test(metaclass=abc.ABCMeta):
+     """ Abstract base class for Test classes
+ 
+diff --git a/framework/test/deqp.py b/framework/test/deqp.py
+index 849ffbd96..ccfeaeff2 100644
+--- a/framework/test/deqp.py
++++ b/framework/test/deqp.py
+@@ -26,7 +26,7 @@ import subprocess
+ from framework import core, grouptools, exceptions
+ from framework import options
+ from framework.profile import TestProfile
+-from framework.test.base import Test, is_crash_returncode, TestRunError
++from framework.test.base import Test, is_crash_returncode, TestRunError, TestPlaceholder
+ 
+ __all__ = [
+     'DEQPBaseTest',
+@@ -56,7 +56,7 @@ def make_profile(test_list, test_class):
+     for testname in test_list:
+         # deqp uses '.' as the testgroup separator.
+         piglit_name = testname.replace('.', grouptools.SEPARATOR)
+-        profile.test_list[piglit_name] = test_class(testname)
++        profile.test_list[piglit_name] = TestPlaceholder(test_class, testname)
+ 
+     return profile
+ 
+-- 
+2.50.1
+
-- 
2.50.1


