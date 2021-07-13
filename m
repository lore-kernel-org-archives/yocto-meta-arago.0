Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id CE17052B48
	for <meta-arago@arago-project.org>;
	Tue, 13 Jul 2021 03:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38A0640C22;
	Tue, 13 Jul 2021 03:32:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id hEQWhNNYE-pJ; Tue, 13 Jul 2021 03:32:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0554140AB7;
	Tue, 13 Jul 2021 03:32:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5410417462F; Mon, 12 Jul 2021 23:32:48 -0400 (EDT)
Date: Mon, 12 Jul 2021 23:32:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210713033248.GU1528@denix.org>
References: <20210709180401.2977-1-nm@ti.com> <20210709180401.2977-6-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210709180401.2977-6-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts PATCH 5/5] config-build-env: Switch arago-project git repo to ti git repo
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
X-List-Received-Date: Tue, 13 Jul 2021 03:32:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 01:04:01PM -0500, Nishanth Menon wrote:
> Arago-project is on the way down, so flip over to git.ti.com repo
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  lib/oesdk/config-build-env | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
> index cdfa6830eb51..2514acbe6b38 100644
> --- a/lib/oesdk/config-build-env
> +++ b/lib/oesdk/config-build-env
> @@ -1,6 +1,6 @@
>  #!/bin/bash
>  
> -TI_SDK_OELAYER_SETUP="http://arago-project.org/git/projects/oe-layersetup.git"
> +TI_SDK_OELAYER_SETUP="http://git.ti.com/git/arago-project/oe-layersetup.git"

What's the preferred clone method on git.ti.com? I see Web UI shows these:

Clone
https://git.ti.com/git/arago-project/oe-layersetup.git
https://git.ti.com/cgit/arago-project/oe-layersetup
git://git.ti.com/arago-project/oe-layersetup.git
http://git.ti.com/git/arago-project/oe-layersetup.git


>  # This script is intended to be called only from the top-level build-oesdk.sh
>  # script which parses the configuration file and sets necessary variables.
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

