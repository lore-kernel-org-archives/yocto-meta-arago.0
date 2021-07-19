Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D513B52A59
	for <meta-arago@arago-project.org>;
	Mon, 19 Jul 2021 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5DF2040C50;
	Mon, 19 Jul 2021 22:01:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LNopeJKDkRkM; Mon, 19 Jul 2021 22:01:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4626F40A03;
	Mon, 19 Jul 2021 22:01:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 07B4D17463C; Mon, 19 Jul 2021 18:01:21 -0400 (EDT)
Date: Mon, 19 Jul 2021 18:01:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Message-ID: <20210719220120.GE1528@denix.org>
References: <1623874449-31873-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1623874449-31873-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH 0/2] RFC: Add global Docker container runtime
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
X-List-Received-Date: Mon, 19 Jul 2021 22:01:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Were there any comments on this series?

On Wed, Jun 16, 2021 at 04:14:07PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This patchset adds Docker container runtime to both base and default rootfs 
> images for all platforms.
> 
> Patch 1 enables necessary kernel configs through docker.cfg config fragment. 
> This fragment can later be added to ti-linux-kernel/ti_config_fragments.
> 
> Denys Dmytriyenko (2):
>   linux-ti-staging: enable necessary configs for running docker
>     containers
>   packagegroup-arago-base: add docker runtime to the base and default
>     rootfs
> 
>  .../packagegroups/packagegroup-arago-base.bb         |  1 +
>  meta-arago-distro/recipes-kernel/linux/docker.inc    |  2 ++
>  .../linux/linux-ti-staging-rt_%.bbappend             |  1 +
>  .../linux/linux-ti-staging-systest_%.bbappend        |  1 +
>  .../recipes-kernel/linux/linux-ti-staging/docker.cfg | 20 ++++++++++++++++++++
>  .../recipes-kernel/linux/linux-ti-staging_%.bbappend |  1 +
>  6 files changed, 26 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg
> 
> -- 
> 2.7.4

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

