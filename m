Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 803A3520EA
	for <meta-arago@arago-project.org>;
	Thu, 14 Jan 2021 18:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 44A8240BFF;
	Thu, 14 Jan 2021 18:24:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UFBg2eB46rJi; Thu, 14 Jan 2021 18:24:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 272E6409AE;
	Thu, 14 Jan 2021 18:24:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 77526174512; Thu, 14 Jan 2021 13:24:51 -0500 (EST)
Date: Thu, 14 Jan 2021 13:24:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20210114182451.GH4892@denix.org>
References: <20210114164743.2340-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210114164743.2340-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master] [RFC PATCH] branding: Add branding-core-next to aid in migration
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
X-List-Received-Date: Thu, 14 Jan 2021 18:24:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 14, 2021 at 10:47:43AM -0600, Dan Murphy wrote:
> Add a core-next brand branding type to be able to re-direct the recipe
> preferred providers or versions to highest PV'd recipe. The
> branding-core should indicate the current version to build if not the
> highest version.
> 
> For the purpose of an example the Arago distribution will be migrating
> from the 5.4 kernel to the 5.10 during the 2021 time frame.  In order to
> assist with a smoother migration the distribution needs to be able to
> build the 5.4 kernel for the core brand and build the 5.10 kernel for
> the core-next.
> 
> Once the transition from 5.4->5.10 kernel is done then the
> PREFERRED_VERSION in the branding-core.inc can be removed.
> 
> From: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../conf/distro/include/branding-core-next.inc              | 6 ++++++
>  meta-arago-distro/conf/distro/include/branding-core.inc     | 3 +++
>  2 files changed, 9 insertions(+)
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-core-next.inc
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
> new file mode 100644
> index 000000000000..d65c5db2f379
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
> @@ -0,0 +1,6 @@
> +# Special "migration" branding for testing components that are to be updated in LTS migration
> +
> +require branding-core.inc
> +
> +PREFERRED_VERSION_linux-ti-staging = ""
> +PREFERRED_VERSION_u-boot-ti-staging = ""
> diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
> index cab9831be9f9..a0abc6230780 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core.inc
> @@ -11,3 +11,6 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
>  
>  # Raise priority for sample IPC FW images
>  ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
> +
> +PREFERRED_VERSION_linux-ti-staging = "5.4%"

Should also include linux-ti-staging-rt and linux-ti-staging-systest


> +PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
> -- 
> 2.29.2
> 

