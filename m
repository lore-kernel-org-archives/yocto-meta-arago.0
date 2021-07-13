Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 97C7152B48
	for <meta-arago@arago-project.org>;
	Tue, 13 Jul 2021 03:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 69C4840C22;
	Tue, 13 Jul 2021 03:34:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NaunVqkY0QQU; Tue, 13 Jul 2021 03:34:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4169940AB7;
	Tue, 13 Jul 2021 03:34:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0FD7A17462F; Mon, 12 Jul 2021 23:34:27 -0400 (EDT)
Date: Mon, 12 Jul 2021 23:34:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210713033427.GV1528@denix.org>
References: <20210709180401.2977-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210709180401.2977-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts PATCH 0/5] config-build-env: Switch to arago-project git
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
X-List-Received-Date: Tue, 13 Jul 2021 03:34:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 01:03:56PM -0500, Nishanth Menon wrote:
> Here are a series of patches that are meant to:
> a) be more paranoid in checking the environment it runs in
> b) additional cleanups in case of weird corner cases where build folder
>    is left in weird state
> c) Finally switch over to git.ti.com tree instead of arago-project.org
>    tree for the new location of oe-layer-setup

Overall, changes look sane to me. Thanks.


> Nishanth Menon (5):
>   config-build-env: Move the oe-layer-setup to a variable
>   config-build-env: Lets make sure we are really in a build folder
>   config-build-env: Refactor to cleanup messed up build folder
>   config-build-env: Make sure that the git url points correctly
>   config-build-env: Switch arago-project git repo to ti git repo
> 
>  lib/oesdk/config-build-env | 46 +++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 10 deletions(-)
> 
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

