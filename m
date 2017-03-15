Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E12D452A2E
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 15:26:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2FFQD51026534
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 10:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489591573;
	bh=shv/yBhulnXNxUwX+hu56WOSC7p1yAPvSb+g/5sw3hU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=l/D23OXLJVKxBfdv+skhBZywXDoVl8iZ+8D77KEjHfISb21M1N7fkgsrMlEGYmyP+
	JqcyTtL+BrjAjEFxcCasFyUcmZXU2CBtSAqERVU4KZsAytD+URHVGNlfG7FKpeGE7G
	UEZwQawlmYvFDZk6TOD4ov667GMb8fLaolqTok5w=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2FFQDSu001197
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 10:26:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 10:26:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2FFQDeV026770;
	Wed, 15 Mar 2017 10:26:13 -0500
Date: Wed, 15 Mar 2017 11:26:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170315152610.GT578@edge>
References: <1489429904-13863-1-git-send-email-a0393906@ti.com>
	<20170314222213.GQ578@edge> <58C8A9B2.40606@ti.com>
MIME-Version: 1.0
In-Reply-To: <58C8A9B2.40606@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master] weston: Add SoC performance monitoring utilities
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
X-List-Received-Date: Wed, 15 Mar 2017 15:26:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 15, 2017 at 08:10:50AM +0530, Karthik Ramanan wrote:
> Denys,
> 
> Yes this is for morty.
> May be I missed a notification on this, I'm thinking morty=master?
> Should I mention morty explicitly?
> 
> 
> On 15-Mar-17 3:52 AM, Denys Dmytriyenko wrote:
> >BTW, can this be done in a separate recipe to add additional app clients,
> >instead of a patch to Weston? This is not scalable/portable at all...
> I take your point.
> For now, lets have this patch in this way. There have been no
> changes to the application for sometime.
> If it undergoes additional changes we will explore ways of combining
> them. There is an ongoing effort to consolidate applications so we
> will include this one as well.

A bit confused by your statement above...

I was talking about "SoC performance monitoring utilities" added by this patch 
being Weston clients. In other words, they are just apps talking to Weston and 
hence should be in own separate code bases built by separate recipes. Not as a 
patch on top of Weston...

Are you saying if you don't envision any changes to these SoC monitoring apps, 
then you'll keep on carrying them as a Weston patch?

-- 
Denys

