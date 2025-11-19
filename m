Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40444CF58C5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:05:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13678.1763575489935566888
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 10:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E71640C56;
	Wed, 19 Nov 2025 18:04:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuGI_i61Vso9; Wed, 19 Nov 2025 18:04:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C8E5407E5;
	Wed, 19 Nov 2025 18:04:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AAD52175783; Wed, 19 Nov 2025 13:04:42 -0500 (EST)
Date: Wed, 19 Nov 2025 13:04:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: sadik <s-sadik@ti.com>, meta-arago@lists.yoctoproject.org,
	Prudhvi Veeramchaneni <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v5] coremark: add Coremark CPU
 benchmark
Message-ID: <20251119180442.GH3125@denix.org>
References: <20251119124115.1228847-1-s-sadik@ti.com>
 <9738a8bc-244f-4199-bbe9-9e33313bfcd6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9738a8bc-244f-4199-bbe9-9e33313bfcd6@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 18:05:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16797

On Wed, Nov 19, 2025 at 11:27:01AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 11/19/2025 6:41 AM, sadik wrote:
> >Add CoreMark benchmark recipe to measure CPU
> >performance on TI platforms,Integrate CoreMark
> >into ti-test package group alongside arm-benchmarks.
> >
> >CoreMark is an industry-standard CPU benchmark from
> >EEMBC(Embedded Microprocessor Benchmark Consortium)
> >that provides a standardized method to test the
> >performance of processors.
> >
> >Signed-off-by: sadik <s-sadik@ti.com>
> >---
> >
> >Changes in v5:
> >- change subject line to include recipe name
> >- append _git to recipe name for tracking of version
> >
> >Link to v4:https://lists.yoctoproject.org/g/meta-arago/message/16784
> >
> >Changes in v4:
> >- change logs moved after the "---" line
> >- change the summary of the coremark in recipe
> >
> >Link to v3:https://lists.yoctoproject.org/g/meta-arago/message/16776
> >
> >Changes in v3:
> >- sent patch via UTF-8 encoding
> >
> >Changes in v2:
> >- Include Coremark licese file in licenses
> >- Use oe_runmake with proper compiler flags for cross-compilation
> >- Removed unnecessary TARGET_CC_ARCH, COMPATIBLE_HOST, and SRC_URI checksum
> >- Move coremark in alphabetical order in TI_TEST_TI_TOOLS
> >
> >Link to v1:https://lists.yoctoproject.org/g/meta-arago/message/16707
> >
> >---
> >  meta-arago-test/licenses/Coremark             | 91 +++++++++++++++++++
> >  .../coremark/coremark_git.bb                  | 18 ++++
> >  .../recipes-core/packagegroups/ti-test.bb     |  1 +
> >  3 files changed, 110 insertions(+)
> >  create mode 100644 meta-arago-test/licenses/Coremark
> >  create mode 100644 meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
> >
> >diff --git a/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
> >new file mode 100644
> >index 00000000..7655a445
> >--- /dev/null
> >+++ b/meta-arago-test/recipes-benchmark/coremark/coremark_git.bb
> >@@ -0,0 +1,18 @@
> >+SUMMARY = "Industry-standard benchmark that measures CPU performance"
> >+
> >+LICENSE = "Coremark"
> >+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a18b17ae63deaa8a595035f668aebe1"
> >+
> >+SRC_URI = "git://github.com/eembc/coremark.git;branch=main;protocol=https"
> >+SRCREV = "1f483d5b8316753a742cbf5590caf5bd0a4e4777"
> >+
> >+S = "${WORKDIR}/git"
> 
> This patch looks better, and I'll start testing it today.  But I
> also need a master version of this patch since this recipe will not
> work in master as is.
> 
> The only change that I think is needed is to remove the line:
> 
> S = "${WORKDIR}/git"

It still doesn't set the version, as _git suffix in the filename isn't for 
that.

I see when CoreMark sources were imported into GitHub, they were tagged as 
1.01 corresponding to a 2009 release, and no new releases or tags were made 
since then:

https://github.com/eembc/coremark/releases/tag/v1.01

This means we should probably add

PV = "1.01+git"

to base off of the release and track individual commits since then.


> >+do_compile() {
> >+    oe_runmake PORT_DIR=linux CC="${CC}" XCFLAGS="${CFLAGS}" LFLAGS_END="${LDFLAGS}" compile
> >+}
> >+
> >+do_install() {
> >+    install -d ${D}${bindir}
> >+    install -m 0755 ${S}/coremark.exe ${D}${bindir}/coremark
> >+}
> >diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >index c1166bc2..e05add8b 100644
> >--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >@@ -89,6 +89,7 @@ TI_TEST_BASE:append:armv7ve = " \
> >  TI_TEST_TI_TOOLS = " \
> >      arm-benchmarks \
> >      arm-ddr-bandwidth \
> >+    coremark \
> >      cpuloadgen \
> >      input-utils \
> >      ltp-ddt \

