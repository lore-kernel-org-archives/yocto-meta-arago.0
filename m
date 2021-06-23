Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 64A4952A4B
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 19:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 47AE940C53;
	Wed, 23 Jun 2021 19:14:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id aVlhfKs0Pf0s; Wed, 23 Jun 2021 19:14:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 21AFD409E0;
	Wed, 23 Jun 2021 19:14:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DCF21174603; Wed, 23 Jun 2021 15:14:49 -0400 (EDT)
Date: Wed, 23 Jun 2021 15:14:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Message-ID: <20210623191449.GJ1528@denix.org>
References: <20210623023538.32735-1-nm@ti.com>
	<20210623023538.32735-2-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210623023538.32735-2-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup PATCH 1/3] sample-files: Add a URL redirection gitconfig sample file
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
X-List-Received-Date: Wed, 23 Jun 2021 19:14:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 22, 2021 at 09:35:36PM -0500, Nishanth Menon wrote:
> As we move git repositories over to newer locations, there is
> a definite need to redirect older url usage to newer locations.
> 
> Lets start with a basic configuration for the core repositories.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  sample-files/gitconfig.sample | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 sample-files/gitconfig.sample
> 
> diff --git a/sample-files/gitconfig.sample b/sample-files/gitconfig.sample
> new file mode 100644
> index 000000000000..2d06bdcd80b9
> --- /dev/null
> +++ b/sample-files/gitconfig.sample
> @@ -0,0 +1,16 @@
> +# Sample git config URL redirection
> +# Copy this information to ~/.gitconfig or equivalent
> +# See https://git-scm.com/docs/git-config for further information
> +# To debug, use GIT_CURL_VERBOSE=1 GIT_TRACE=1
> +
> +[url "git://git.yoctoproject.org/meta-arago"]
> +	insteadOf = git://arago-project.org/git/meta-arago
> +	insteadOf = http://arago-project.org/git/meta-arago
> +
> +[url "git://git.yoctoproject.org/meta-ti"]
> +	insteadOf = git://arago-project.org/git/meta-ti
> +	insteadOf = http://arago-project.org/git/meta-ti
> +
> +[url "git://git.ti.com/arago-project/oe-layersetup"]
> +	insteadOf = git://arago-project.org/git/projects/oe-layersetup
> +	insteadOf = http://arago-project.org/git/projects/oe-layersetup
> -- 
> 2.32.0
> 

