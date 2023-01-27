Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F82C05027
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 00:51:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.91974.1674780683794998409
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 16:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Wn9v9qTF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30R0pJu8012995;
	Thu, 26 Jan 2023 18:51:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674780679;
	bh=ZTqWYGV2xF3HKGNWfJzDLBOtFkO+XWdRXB9dXqdOtdE=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=Wn9v9qTFbTah19215RR5ja8PD7Er8zOaAL7t6e/nytsBqJV/p6BWtJHni6J+pl3Jc
	 0og+Of1DURvca0NhaDn+u58zD3y/+4kq0l2rjxLh5ht9dJvxoXiDIkietEA4mF5gGi
	 q3udL1MOMuY+YSomKAutVuyK27TlpqJ5NwmzBu7M=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30R0pJii081103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jan 2023 18:51:19 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 26
 Jan 2023 18:51:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 26 Jan 2023 18:51:18 -0600
Received: from res.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30R0pIlF019229;
	Thu, 26 Jan 2023 18:51:18 -0600
Date: Thu, 26 Jan 2023 18:51:12 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-arago] [PATCH] all: Remove excessive
 switches based on gpu
To: Denys Dmytriyenko <denis@denix.org>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
Message-ID: <D1D4PR.W8OT1AZZ313H@ti.com>
In-Reply-To: <20230126205801.GE22689@denix.org>
References: <20230124231733.2219206-1-rs@ti.com>
	<20230126205801.GE22689@denix.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 00:51:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14189

On Thu, Jan 26 2023 at 03:58:01 PM -0500, Denys Dmytriyenko 
<denis@denix.org> wrote:
> I'm realizing now that simply depending on "opengl" DISTRO_FEATURES 
> won't be
> enough, unfortunately.
> 
> The issue is that DISTRO_FEATURES are set by the distro globally for 
> all
> machines, whether with accelerated graphics, display w/o acceleration 
> or
> completely headless. E.g. when building for J7200, "opengl" will be 
> set, but
> none of the graphics packages should be built or installed into the 
> image.
> 
> So, some sort of check for MACHINE_FEATURES or PREFERRED_PROVIDER 
> (less
> elegant) would still be needed in some places...

Arguably that's a package group / distro target issue. I believe when a 
user selects the default image with all features enabled for J721E and 
J721S2 the package selection should be equivalent (or at least as 
equivalent as possible with the stuff going on now in meta-ti) to align 
with the distro features selected. I believe the solution to this is to 
add a headless target/image that removes Qt, GTK, etc. from the 
selected package groups and to suggest the use of that instead if users 
want a truly headless distro.



