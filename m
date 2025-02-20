Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC77C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 20:54:38 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.7868.1740084869308925046
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 12:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YiCJHp0t;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KKsSuH118004
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 14:54:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740084868;
	bh=0xrXFrFEBKT2686sPBfwc8RdOWa97Vz9WLyn9hQmHkc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YiCJHp0t//TaghNzTHVxXVGqDtda4bxvF6KDPcDmPB2qGRRXneNSMM/Nc2oHmA9at
	 XIQ4Ql03mL2nO9glxEAKCbdo0mj68yk2HisAi3pIEIezuGlxK/uClvc826jzeAWDR2
	 8XYz9gqqLXrlAL07sC8T22paFnsKbHrj8OxKXQnk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KKsS1f116785
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 14:54:28 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 14:54:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 14:54:28 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KKsSDN096914;
	Thu, 20 Feb 2025 14:54:28 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 2/3 v2] meta-arago-test: ignore compiler warnings patch for opencl-cts
Date: Thu, 20 Feb 2025 14:54:27 -0600
Message-ID: <20250220205428.212747-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220205428.212747-1-a-christidis@ti.com>
References: <20250220205428.212747-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 20:54:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15876

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

Within the cmake build system, the compiler -Werror flag is enabled.  This
turns all warnings into errors and doesn't allow the system to compile
correctly.  Change the system to ignore the 3 warning rules that show up when
compiling.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Fixed spelling mistakes 

 .../files/0001-Ignore-Compiler-Warnings.patch  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch

diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 00000000..067cffa1
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,18 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5cfef6b3..71b6ddb4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
+     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
+     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
+     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
+-
++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
+     # -msse -mfpmath=sse to force gcc to use sse for float math,
+     # avoiding excess precision problems that cause tests like int2float
+     # to falsely fail. -ffloat-store also works, but WG suggested
+-- 
+2.34.1
+
-- 
2.34.1


