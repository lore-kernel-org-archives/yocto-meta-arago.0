Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A7675529A2
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 18:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8D8D40C1C;
	Tue, 16 Mar 2021 18:45:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pGB_ZuxqQPgG; Tue, 16 Mar 2021 18:45:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B2DAA40A47;
	Tue, 16 Mar 2021 18:45:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 768A8174544; Tue, 16 Mar 2021 14:45:12 -0400 (EDT)
Date: Tue, 16 Mar 2021 14:45:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210316184512.GJ18041@denix.org>
References: <20210316170857.9547-1-nm@ti.com>
	<20210316171801.l7ttk4ottbyocpzi@oxidize>
MIME-Version: 1.0
In-Reply-To: <20210316171801.l7ttk4ottbyocpzi@oxidize>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH 0/2] arago-dunfell/dunfell-next: Move to
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
X-List-Received-Date: Tue, 16 Mar 2021 18:44:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 12:18:01PM -0500, Nishanth Menon wrote:
> On 12:08-20210316, Nishanth Menon wrote:
> 
> I have no idea what ate up my $subject -> I intended to add "Move to
> dunfell/dunfell-tip from upstream.
> 
> > 
> > This brings arago-config and arago-next-config both in sync with latest
> > dunfell and dunfell-next tips appropriately.
> > 
> > This series obviously will need to be followed up at an appropriate time
> > with a stable commit sha patch to pin things up.
> 
> K, I might be missing the motivation here - the pinning may not be
> required given that dunfell is always a rolling config.. and used only
> in the cases of exceptions.. So, please ignore my comment.

Looks good to me.

Praneeth, I see you only merged one of two patches?

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

