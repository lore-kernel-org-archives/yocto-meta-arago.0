Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE048FA373E
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 21:30:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.52.1666733427322111320
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 14:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2053840CAA;
	Tue, 25 Oct 2022 21:30:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cz-Q56jahBdQ; Tue, 25 Oct 2022 21:30:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6C1B40CA8;
	Tue, 25 Oct 2022 21:30:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32C9A174A3C; Tue, 25 Oct 2022 17:30:20 -0400 (EDT)
Date: Tue, 25 Oct 2022 17:30:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] net-snmp: Remove broken
 net-snmp recipe
Message-ID: <20221025213020.GY22689@denix.org>
References: <20221025142235.12400-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025142235.12400-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Oct 2022 21:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14090

On Tue, Oct 25, 2022 at 09:22:35AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> This bbappend is not functional on the latest net-snmp. The additional
> patches are ~61k lines, half the entire size of meta-arago. This extra
> functionality should have been added to a forked repo and that is how we
> should add this back if ever needed again. Remove this recipe.

I'm fine with removing these patches, since they break the latest snmp and 
it's been disabled in default images since Kirkstone.

But I'm not so sure about promoting forked repo concept...

The best approach, of course, is to get the patches submitted, reviewed and 
accepted upstream (snmp in this case).

Making changes with patches, instead of a forked repo, has this benefit - when 
updating layer to a new release/LTS and these patches start breaking, it gets 
noticed right away. It forces a decision - either someone is tasked with 
updating the patches and fixing the breakage, or they get removed/disabled at 
least.

Using a forked repo has a high possibility of a stale and outdated component, 
collecting security vulnerabilities, unfixed bugs, etc.

-- 
Denys

