Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60418C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 19:04:10 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.83616.1674241447141890664
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 11:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PkNkmkoM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30KJ46Ca090227
	for <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 13:04:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674241446;
	bh=tGv97EpGZzmlTs5cMopNqZa4iI5N/vBh79a7TXLsTm0=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=PkNkmkoMRwXKoCiA6RSCNECo3lOE0jqPEBRlLAYBMEtFsUqIawgQP3pyKInWdWRw0
	 b9cK9J4cy80/ImxbTMiEhQt+K7RtYaLkt8YVygotVCOwnF5jYQ/iOKuEfoLv0QdOUo
	 dCsOFekoqaEWU0z+w0MRrlg6Bro1B6Jbjwygh5pk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30KJ46C1011056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 13:04:06 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 13:04:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 13:04:06 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30KJ45Io058040;
	Fri, 20 Jan 2023 13:04:05 -0600
Date: Fri, 20 Jan 2023 13:03:59 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [meta-arago] [master/kirkstone][PATCH] all: Graphics recipe
 overhaul
To: Andrew Davis <afd@ti.com>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <NYSSOR.ZG32SG9FGUKC@ti.com>
In-Reply-To: <09c8b020-ed7d-0bb0-6c6b-adcd23388397@ti.com>
References: <20230119204205.1297727-1-rs@ti.com>
	<09c8b020-ed7d-0bb0-6c6b-adcd23388397@ti.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Jan 2023 19:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14179

On Fri, Jan 20 2023 at 11:42:11 AM -0600, Andrew Davis <afd@ti.com> 
wrote:
> This should be MACHINE_FEATURES and be moved out of meta-arago and 
> down
> into the meta-ti layer where we define the mainline kernel if we can.

Ha, you haven't seen the full notes on my other patch have you?
https://lists.yoctoproject.org/g/meta-ti/topic/96386295#15613

I switched these to be COMBINED_FEATURES. Like alsa, they require both 
a machine feature and a distro feature to be present to actually patch 
the packages we need. In this way patches become opt-in and software 
rendering becomes the default unless someone specifically wants a 
distro with powervr-rogue-graphics patches.

In addition if they have a distro that wants powervr-rogue-graphics and 
they are compiling for a machine that doesn't have that feature then it 
will also fall back to software rendering.

The only issue this doesn't solve is when someone wants to hack recipes 
like gstreamer to introduce pseudo graphics support or bundle random 
pieces of the graphics stack without including all of it, but arguably 
that should be a specialized package group or new layer anyway.



