Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C6AF9529B7
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 19:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 074C540C1C;
	Tue, 16 Mar 2021 19:15:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id frprGV08onqS; Tue, 16 Mar 2021 19:15:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4AD640A77;
	Tue, 16 Mar 2021 19:15:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4564D17454A; Tue, 16 Mar 2021 15:15:11 -0400 (EDT)
Date: Tue, 16 Mar 2021 15:15:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <20210316191511.GK18041@denix.org>
References: <20210316170857.9547-1-nm@ti.com>
	<20210316171801.l7ttk4ottbyocpzi@oxidize>
	<20210316184512.GJ18041@denix.org>
	<a2a1382e-63fc-5d1b-d010-195b7a857679@ti.com>
MIME-Version: 1.0
In-Reply-To: <a2a1382e-63fc-5d1b-d010-195b7a857679@ti.com>
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
X-List-Received-Date: Tue, 16 Mar 2021 19:14:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 02:13:09PM -0500, Bajjuri, Praneeth wrote:
> 
> 
> On 3/16/2021 1:45 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 16, 2021 at 12:18:01PM -0500, Nishanth Menon wrote:
> >>On 12:08-20210316, Nishanth Menon wrote:
> >>
> >>I have no idea what ate up my $subject -> I intended to add "Move to
> >>dunfell/dunfell-tip from upstream.
> >>
> >>>
> >>>This brings arago-config and arago-next-config both in sync with latest
> >>>dunfell and dunfell-next tips appropriately.
> >>>
> >>>This series obviously will need to be followed up at an appropriate time
> >>>with a stable commit sha patch to pin things up.
> >>
> >>K, I might be missing the motivation here - the pinning may not be
> >>required given that dunfell is always a rolling config.. and used only
> >>in the cases of exceptions.. So, please ignore my comment.
> >
> >Looks good to me.
> >
> >Praneeth, I see you only merged one of two patches?
> 
> Yes , only pulled the dunfell-next config .. started the build job
> to check if builds are ok. Will pull the dunfell patch in couple of
> hrs.

Ok, thanks.

