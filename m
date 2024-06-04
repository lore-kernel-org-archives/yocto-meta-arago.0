Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D8FC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 17:41:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2387.1717522861616213569
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 10:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D205840C1C;
	Tue,  4 Jun 2024 17:41:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFu8IljW0-HU; Tue,  4 Jun 2024 17:41:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79DC040C06;
	Tue,  4 Jun 2024 17:40:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84715163F85; Tue,  4 Jun 2024 13:40:56 -0400 (EDT)
Date: Tue, 4 Jun 2024 13:40:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap][PATCH] arm-ddr-bandwidth: Bandwidth
 script for testing
Message-ID: <20240604174056.GO21287@denix.org>
References: <20240603161039.16176-1-reatmon@ti.com>
 <20240603161039.16176-2-reatmon@ti.com>
 <20240604160503.GM21287@denix.org>
 <08b013f9-1678-43d5-8399-374620a4b0ef@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08b013f9-1678-43d5-8399-374620a4b0ef@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 17:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15366

On Tue, Jun 04, 2024 at 11:38:32AM -0500, Ryan Eatmon wrote:
> 
> 
> On 6/4/2024 11:05 AM, Denys Dmytriyenko wrote:
> >On Mon, Jun 03, 2024 at 11:10:39AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>We need to pull a single script in from the matrix-gui packages since
> >>they are getting removed.  The runLmDDRBandwidth.sh is required for the
> >>ti-test flow.
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb    | 23 +++++++++++++++++++
> >>  .../recipes-core/packagegroups/ti-test.bb     |  1 +
> >>  2 files changed, 24 insertions(+)
> >>  create mode 100644 meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
> >>
> >>diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
> >>new file mode 100644
> >>index 00000000..fc4aea94
> >>--- /dev/null
> >>+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
> >>@@ -0,0 +1,23 @@
> >>+SUMMARY = "Benchmark for checking DDR bandwidth"
> >>+HOMEPAGE = "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
> >>+LICENSE = "CC-BY-SA-3.0"
> >>+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> >
> >Isn't the default here ^^^ relative to ${S} anyway?
> 
> Could be.  I was making a number of changes to get this recipe
> "right". I'll test it and make sure it works without it.  It might
> be that master now requires the UNPACKDIR and when I backported this
> to scarthgap I didn't check that it was not needed.

Yeah, it should also work for master, as long as LICENSE is in ${S}
And I see there you set UNPACKDIR = "${S}"


> >>+PV = "1.0"
> >>+
> >>+SRC_URI = " \
> >>+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh;name=runLmDDRBandwidth \
> >>+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=license \
> >>+"
> >>+SRC_URI[runLmDDRBandwidth.sha256sum] = "67997d721b351344d8788200a15bb3640093045bc25f2b5307dd331ebd1556a3"
> >>+SRC_URI[license.sha256sum] = "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326695a0cc7074bd6c8d263e3"
> >>+
> >>+S = "${WORKDIR}"
> >>+
> >>+do_install() {
> >>+    install -d ${D}${datadir}/matrix-gui-2.0/apps
> >>+    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
> >>+}
> >>+
> >>+FILES:${PN} = "${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh"
> >>+
> >>diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>index 4dbd9fca..b71c374b 100644
> >>--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>@@ -69,6 +69,7 @@ TI_TEST_BASE:append:armv7ve = " \
> >>  #    timestamping
> >>  TI_TEST_TI_TOOLS = " \
> >>      arm-benchmarks \
> >>+    arm-ddr-bandwidth \
> >>      cpuloadgen \
> >>      input-utils \
> >>      ltp-ddt \
> >>-- 
> >>2.17.1

