Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2AC18520E2
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 18:19:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CIILs4093468
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 13:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568312301;
	bh=4m0lec3bSA0Gd4J+XYPwpgTG/yU8PxduAeXwlvgqE60=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=oOtgyHjWqsxu4xfxNjI6NkLvmljsytkwRKOgXXEe0tP1Liqj9gaTQw6YotfaGCKwf
	Fb04mYE44JTL+ah/6rDXZPDGAYdUd2/5RYKOV8JyxZyIXsxM4vgE1Qe6Gs+J3P1d+g
	C8IBsgDIiwcGoAF2NOFKc2SQrqQzqnvebSkHMThk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CIILNW022439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 13:18:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 12 Sep 2019 13:18:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 13:18:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CIIKTT090888;
	Thu, 12 Sep 2019 13:18:20 -0500
Date: Thu, 12 Sep 2019 14:18:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <20190912181820.GI28369@beryl>
References: <1568098140-193923-1-git-send-email-nikhil.nd@ti.com>
	<1568098140-193923-2-git-send-email-nikhil.nd@ti.com>
	<20190912164341.GG28369@beryl>
	<24973bf4-262b-d90e-78dd-fbecf1954f15@ti.com>
MIME-Version: 1.0
In-Reply-To: <24973bf4-262b-d90e-78dd-fbecf1954f15@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud PATCH v2 2/3] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Thu, 12 Sep 2019 18:19:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 12, 2019 at 11:43:18PM +0530, Nikhil Devshatwar wrote:
> On 12/09/19 10:13 PM, Denys Dmytriyenko wrote:
> >Thanks, what about the test suite for ION?
> This was mainly needed for PSDKRA use cases with Linux.
> There was no request to add any tests.
> >And I was planning to add those to meta-ti anyway...
> That's fair, I don't have a specific choice.
> as long as it gets packaged in the rootfs, I'm good.

Sounds good. I'll submit libion+test to meta-ti later today.


> Nikhil D
> >
> >On Tue, Sep 10, 2019 at 12:18:59PM +0530, Nikhil Devshatwar wrote:
> >>From: Denys Dmytriyenko <denys@ti.com>
> >>
> >>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>---
> >>Changes from v1:
> >>* Retained original authorship
> >>
> >>  meta-arago-extras/recipes-devtools/ion/libion_git.bb | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>  create mode 100644 meta-arago-extras/recipes-devtools/ion/libion_git.bb
> >>
> >>diff --git a/meta-arago-extras/recipes-devtools/ion/libion_git.bb b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
> >>new file mode 100644
> >>index 0000000..7c93ed3
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
> >>@@ -0,0 +1,14 @@
> >>+SUMMARY = "ION Userspace Memory Allocator Library"
> >>+HOMEPAGE = "https://github.com/glneo/libion"
> >>+LICENSE = "Apache-2.0"
> >>+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> >>+
> >>+PV = "1.0.0"
> >>+
> >>+BRANCH = "master"
> >>+SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
> >>+SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
> >>+
> >>+S = "${WORKDIR}/git"
> >>+
> >>+inherit cmake pkgconfig
> >>-- 
> >>1.9.1
> >>
> 

