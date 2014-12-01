Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0FFE0529D3
	for <meta-arago@arago-project.org>;
	Mon,  1 Dec 2014 21:49:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB1Lncwo005641
	for <meta-arago@arago-project.org>; Mon, 1 Dec 2014 15:49:38 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB1Lnc0d026695
	for <meta-arago@arago-project.org>; Mon, 1 Dec 2014 15:49:38 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Dec 2014 15:49:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB1Lncw5003366;
	Mon, 1 Dec 2014 15:49:38 -0600
Date: Mon, 1 Dec 2014 16:49:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Message-ID: <20141201214937.GE5113@edge>
References: <E60A9E1B4132A24DB80BD56ABC926847D2DB79@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <E60A9E1B4132A24DB80BD56ABC926847D2DB79@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Applying non local patches
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
X-List-Received-Date: Mon, 01 Dec 2014 21:49:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 14, 2014 at 01:02:09PM +0000, Devshatwar, Nikhil wrote:
> Hi all,
> Does yocto support applying patches which are under review
> It is possible to download the patch and add it to the recipe along with the actual patch file
> 
> But  is there another way where we can point to the patches in the SRC_URI itself
> 
> Something similar to
> 
> SRC_URI= "git:git.fredesktop.org/project/repo.git;protocol=git \
>       http://patchwork.freedesktop/project/repo/12345/raw;protocol=http \
> "
> Are there any examples of such reciepes
> Please help

Nikhil,

It's not recommended, but it was always possible. Here's an old example from 
OE Classic, as I couldn't find any recent one:

http://cgit.openembedded.org/openembedded/tree/recipes/busybox/busybox_1.7.2.bb

We moved away from that practice, as upstream used to constantly tweak and 
change patches, breaking the build all the time. Having patches in metadata 
gives more control, as updating patches, their checksums and making sure the 
build doesn't break can be done at the same time.

-- 
Denys

