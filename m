Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04F7EFCE52
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 23:08:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31811.1772665729198686823
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 15:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 99F5A40BD4;
	Wed,  4 Mar 2026 23:08:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDzachJw2WIn; Wed,  4 Mar 2026 23:08:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4867740BA7;
	Wed,  4 Mar 2026 23:08:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DD6501796A3; Wed,  4 Mar 2026 18:08:43 -0500 (EST)
Date: Wed, 4 Mar 2026 18:08:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com,
	c-shilwant@ti.com
Subject: Re: [meta-arago][master][PATCH v2] linuxptp: Add support for HSR
 in Linux ptp
Message-ID: <20260304230843.GK11121@denix.org>
References: <20260302103515.848554-1-danishanwar@ti.com>
 <20260302204051.GF11121@denix.org>
 <f31cb559-5a0b-435b-b919-cbf637547343@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f31cb559-5a0b-435b-b919-cbf637547343@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 23:08:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17224

On Tue, Mar 03, 2026 at 10:54:24AM +0530, MD Danish Anwar wrote:
> Hi Denys,
> 
> On 03/03/26 2:10 am, Denys Dmytriyenko wrote:
> > On Mon, Mar 02, 2026 at 04:05:15PM +0530, MD Danish Anwar via lists.yoctoproject.org wrote:
> >> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> >> ---
> >> These patches have been posted to upstream linuxptp mailing list.
> >> https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00013.html
> >> They are currently under review.
> >>
> >> v1 -> v2:
> >>   Added Upstream Status in each patch.
> >>
> >>  .../linuxptp/linuxptp-arago.inc               |  19 +
> >>  ...age-of-non-PTP-packets-during-socket.patch |  81 +++
> >>  ...d-dataset_comparison-type-IEC62439-3.patch | 217 +++++++
> >>  .../0003-Add-PASSIVE_SLAVE-state.patch        | 275 +++++++++
> >>  .../0004-rtnl-Add-rtnl_get_hsr_devices.patch  | 120 ++++
> >>  .../0005-port-Add-paired_port-option.patch    | 175 ++++++
> >>  ...-a-state-engine-for-redundant-master.patch | 519 ++++++++++++++++
> >>  ...ouble-attached-clock-hybrid-clock-HC.patch | 444 ++++++++++++++
> >>  ...orward-packets-both-ways-in-DAC-mode.patch |  37 ++
> >>  ...guard-in-case-PASSIVE_SLAVE-attempts.patch |  37 ++
> >>  ...w-to-forward-packets-in-LISTEN-state.patch |  61 ++
> >>  .../linuxptp/0011-raw-Add-HSR-handling.patch  | 567 ++++++++++++++++++
> >>  ...Add-sample-configs-for-the-HSR-setup.patch |  96 +++
> >>  ...2p_dst_mac-to-avoid-IEEE-802.1-reser.patch |  47 ++
> >>  .../linuxptp/linuxptp_%.bbappend              |   4 +
> >>  15 files changed, 2699 insertions(+)
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-port-Add-dataset_comparison-type-IEC62439-3.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-Add-PASSIVE_SLAVE-state.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-rtnl-Add-rtnl_get_hsr_devices.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-port-Add-paired_port-option.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-fsm-Add-a-state-engine-for-redundant-master.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-raw-Add-HSR-handling.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-configs-Add-sample-configs-for-the-HSR-setup.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
> >>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
> >>
> >> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
> >> new file mode 100644
> >> index 00000000..17819cf3
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
> >> @@ -0,0 +1,19 @@
> >> +PR:append = ".arago6"
> > 
> > This is the first submission, why is it .arago6?
> > 
> 
> This is my first time submitting patch to meta-arago. I am not aware 6
> mean in `.arago6`.
> 
> I just looked at the code for iproute2 [1] (as there also custom patches
> are being applied) and followed the same syntax for linuxptp.
> 
> Can you please let me know what should I use here?

https://docs.yoctoproject.org/ref-manual/variables.html#term-PR

It extends the regular PR var, hence should start from 0, i.e. ".arago0"
But in general, updating PR manually is no longer required any more.


> >> +FILESEXTRAPATHS:prepend := "${THISDIR}/linuxptp:"
> >> +
> >> +SRC_URI:append = " \
> > 
> > There's absolutely no reason to suee :append here vs. a simple +=
> > 
> > 
> >> +    file://0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch \
> >> +    file://0002-port-Add-dataset_comparison-type-IEC62439-3.patch \
> >> +    file://0003-Add-PASSIVE_SLAVE-state.patch \
> >> +    file://0004-rtnl-Add-rtnl_get_hsr_devices.patch \
> >> +    file://0005-port-Add-paired_port-option.patch \
> >> +    file://0006-fsm-Add-a-state-engine-for-redundant-master.patch \
> >> +    file://0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch \
> >> +    file://0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch \
> >> +    file://0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch \
> >> +    file://0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch \
> >> +    file://0011-raw-Add-HSR-handling.patch \
> >> +    file://0012-configs-Add-sample-configs-for-the-HSR-setup.patch \
> >> +    file://0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch \
> >> +"
> >> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
> >> new file mode 100644
> >> index 00000000..ea0f968c
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
> >> @@ -0,0 +1,81 @@
> >> +From 5afe386619bfcded393fd5a9ea5d7c9bbcf05823 Mon Sep 17 00:00:00 2001
> >> +From: Cliff Spradlin <cspradlin@google.com>
> >> +Date: Thu, 2 Oct 2025 18:37:54 -0700
> >> +Subject: [PATCH 01/13] raw: Prevent leakage of non-PTP packets during socket
> >> + init
> >> +
> >> +There were two problems with the socket configuration sequencing:
> >> +
> >> +1) Calling socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL)) causes all
> >> +ethernet frames from -all- interfaces to be queued to the socket,
> >> +until bind() is later called.
> >> +
> >> +2) The BPF filter is installed -after- bind() is called, so ethernet
> >> +frames that should be rejected could be queued before the BPF filter
> >> +is installed.
> >> +
> >> +This patch reorders the raw socket initialization so that all
> >> +configuration happens before bind() is called.
> >> +
> >> +Signed-off-by: Cliff Spradlin <cspradlin@google.com>
> >> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> >> +---
> >> +Upstream-Status:
> >> +Submitted
> >> +  Submitted to upstream, waiting approval
> >> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00007.html
> > 
> > While there's no specific requirement to have this before the --- line, it 
> > still must be in a single line. Same comment to all patches.
> > 
> 
> Sure. I will address this in v3.
> 
> > 
> >> +
> >> + raw.c | 22 +++++++++++-----------
> 
> [1]
> https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%25.bbappend?h=scarthgap-next&id=ee4d898485d9474abacf8ec092e61fdfc0efa348

