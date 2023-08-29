Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99CEC83F11
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 00:29:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7243.1693268938834575377
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 17:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2155040C3A;
	Tue, 29 Aug 2023 00:28:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZbDld8CfEYX; Tue, 29 Aug 2023 00:28:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E65B040C22;
	Tue, 29 Aug 2023 00:28:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0517E163C94; Mon, 28 Aug 2023 20:28:53 -0400 (EDT)
Date: Mon, 28 Aug 2023 20:28:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] flatbuffers: Add
 protocol and branch to SRC_URI
Message-ID: <20230829002852.GS3359@denix.org>
References: <20230828221423.22410-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828221423.22410-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Aug 2023 00:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14877

On Mon, Aug 28, 2023 at 05:14:23PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Add missing protocol and branch to the SRC_URI to remove new warning
> messages.

Should also be removed - it's an ancient version that was "backported" from 
meta-oe 4 years ago. And more recent versions now available in meta-oe:

http://layers.openembedded.org/layerindex/recipe/301166/

There were some specific-version requirements for armnn+tensorflow back then. 
Is it still the case?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> index 92363915..7f7b8b99 100644
> --- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> +++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
>  
>  SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
>  
> -SRC_URI = "git://github.com/google/flatbuffers.git"
> +SRC_URI = "git://github.com/google/flatbuffers.git;protocol=https;branch=master"
>  
>  # Make sure C++11 is used, required for example for GCC 4.9
>  CXXFLAGS += "-std=c++11"
> -- 
> 2.17.1

