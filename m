Return-Path: <yogeshs@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 78B4352AB8
	for <meta-arago@arago-project.org>;
	Thu,  8 Jul 2021 11:18:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 168BItwp060257;
	Thu, 8 Jul 2021 06:18:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625743135;
	bh=nQSniklZ/9Vm35DM9l8TgswHFKMD1q19YO4VII0OSYM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jUdJf71l6qHLnAGVDMM+bhnsCZMtBnZBMZBvBUuJHkjtYqaIj3nop3lvuYA2rcxRR
	jwgEfUWrodlCNQDaspcTTQiUEG7+xi0QEw+HheTbr6vDLDGxa3nNNeZqzD1UT1pNmK
	11gZ2pwSuj0Gmg6OZPafQQMUHewvEJJ6TuesGozQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 168BIsiZ059129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 06:18:55 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 8 Jul 2021 06:18:54 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
	DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
	15.01.2176.012; Thu, 8 Jul 2021 06:18:54 -0500
From: "Siraswar, Yogesh" <yogeshs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH][dunfell/master]
	linux-libc-headers: update to 5.10 kernel headers
Thread-Index: AQHXcwOMYYgSOWa390Klutk0pfHPF6s45WUQ
Date: Thu, 8 Jul 2021 11:18:54 +0000
Message-ID: <776eb5416e414e9cac1fe14d9adda4d4@ti.com>
References: <1625643698-32948-1-git-send-email-denis@denix.org>
In-Reply-To: <1625643698-32948-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.66.214]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [PATCH][dunfell/master] linux-libc-headers: update to 5.10 kernel headers
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
X-List-Received-Date: Thu, 08 Jul 2021 11:18:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Running into QA issue with this patch:

DEBUG: Executing python function populate_lic_qa_checksum
ERROR: QA Issue: nativesdk-linux-libc-headers: The LIC_FILES_CHKSUM does no=
t match for file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814
nativesdk-linux-libc-headers: The new md5 checksum is 6bc538ed5bd9a7fc93980=
86aedcd7e46
nativesdk-linux-libc-headers: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
The Linux Kernel is provided under:

	SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note

Being under the terms of the GNU General Public License version 2 only,
according with:

	LICENSES/preferred/GPL-2.0

With an explicit syscall exception, as stated at:
...

	LICENSES/exceptions/Linux-syscall-note

In addition, other licenses may also apply. Please see:

	Documentation/process/license-rules.rst

for more details.

All contributions to the Linux Kernel are subject to this COPYING file.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nativesdk-linux-libc-headers: Check if the license information has changed =
in /OE/arago-dunfell-next-build/build-CORTEX_1/arago-tmp-external-arm-glibc=
/work/x86_64-nativesdk-arago-linux/nativesdk-linux-libc-headers/5.10-r0.ara=
go0/git/COPYING to verify that the LICENSE value "GPLv2" remains valid [lic=
ense-checksum]
ERROR: Fatal QA errors found, failing task.
DEBUG: Python function populate_lic_qa_checksum finished

-----Original Message-----
From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-projec=
t.org> On Behalf Of Denys Dmytriyenko
Sent: Wednesday, July 7, 2021 2:42 AM
To: meta-arago@arago-project.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [EXTERNAL] [meta-arago] [PATCH][dunfell/master] linux-libc-headers=
: update to 5.10 kernel headers

From: Denys Dmytriyenko <denys@konsulko.com>

This recipe is used when building using an internal toolchain. Use the same=
 commit ID as for external-arm-toolchain.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../{linux-libc-headers_5.4.bb =3D> linux-libc-headers_5.10.bb}         | =
4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)  rename meta-arago-distro/=
recipes-kernel/linux-libc-headers/{linux-libc-headers_5.4.bb =3D> linux-lib=
c-headers_5.10.bb} (80%)

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc=
-headers_5.4.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux=
-libc-headers_5.10.bb
similarity index 80%
rename from meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-=
headers_5.4.bb
rename to meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-he=
aders_5.10.bb
index c0a3709..0dabbfd 100644
--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-header=
s_5.4.bb
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-hea
+++ ders_5.10.bb
@@ -4,8 +4,8 @@ PR_append =3D ".arago0"
=20
 DEPENDS +=3D "rsync-native"
=20
-BRANCH =3D "ti-linux-5.4.y"
-SRCREV =3D "1661da3fddf4cc3f62796ecfb5c572f1e5361bdf"
+BRANCH =3D "ti-linux-5.10.y"
+SRCREV =3D "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
=20
 KERNEL_GIT_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL =3D "git"
--
2.7.4

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

