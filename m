Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC748C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 00:44:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2130.1665449094100557879
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 17:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 64D1340D26;
	Tue, 11 Oct 2022 00:44:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbDPLRPQlYFs; Tue, 11 Oct 2022 00:44:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2977340D06;
	Tue, 11 Oct 2022 00:44:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A6722174A18; Mon, 10 Oct 2022 20:44:45 -0400 (EDT)
Date: Mon, 10 Oct 2022 20:44:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: praneeth@ti.com
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-arago@lists.yoctoproject.org,
	reatmon@ti.com, c-shilwant@ti.com, s-adivi@ti.com
Subject: Re: [[meta-arago][tisdk-setup-scripts][master][PATCH]]
 create-sdcard : Correct if condition which checks for boot images
Message-ID: <20221011004445.GD30861@denix.org>
References: <20221010074049.13114-1-p-bhagat@ti.com>
 <0928849a-7b9c-bdc3-21f7-09f3d870336f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0928849a-7b9c-bdc3-21f7-09f3d870336f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 00:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14064

On Mon, Oct 10, 2022 at 05:32:23PM -0500, praneeth via lists.yoctoproject.org wrote:
> On 10/10/2022 2:40 AM, Paresh Bhagat wrote:
> >Jira - https://jira.itg.ti.com/browse/SITSW-1649
> 
> This is upstream mailing list.
> 
> Please keep the TI internal jira-ids away from commit descriptions
> or cover-letters please.

The Subject line contains double/netsted brackets:

[[meta-arago][tisdk-setup-scripts][master][PATCH]] create-sdcard : Correct if condition which checks for boot images

Which doesn't play nice with the Patchwork and stray brackets end up in git 
history:

https://git.ti.com/cgit/arago-project/oe-layersetup/commit/?id=f80538808a4d82457766388e95929e075871dd6d

The list automatically adds [meta-arago], so when sending out, your patch 
Subject should look like:

[tisdk-setup-scripts][PATCH] create-sdcard: Correct if condition which checks for boot images

Thanks,
Denys


> >The if condition which checks for boot binaries for am65xx and
> >j7 devices has no spaces which shows error while running create-sdcard.sh.
> >Add the required spaces in if condition.
> >
> >Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >---
> >  create-sdcard.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/create-sdcard.sh b/create-sdcard.sh
> >index 4af6c94..5c3490a 100644
> >--- a/create-sdcard.sh
> >+++ b/create-sdcard.sh
> >@@ -1057,7 +1057,7 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
> >  	echo ""
> >  	#copy boot files out of board support
> >-        if ["$TARDEVICENAME" == "am65xx"] || ["$TARDEVICENAME" == "j7"]; then
> >+        if [ "$TARDEVICENAME" == "am65xx" ] || [ "$TARDEVICENAME" == "j7" ]; then
> >  		if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
> >  			echo "Boot image not found"
> >  		fi

