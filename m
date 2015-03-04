Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7795152A52
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 20:20:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24KKScR007101
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:20:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24KKRT4006561
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 14:20:27 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 14:20:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24KKQJi025519;
	Wed, 4 Mar 2015 14:20:27 -0600
Date: Wed, 4 Mar 2015 15:20:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20150304202026.GK6052@edge>
References: <1425499517-11576-1-git-send-email-fcooper@ti.com>
	<1425499517-11576-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425499517-11576-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] stream: Add append for TISDK customizations
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
X-List-Received-Date: Wed, 04 Mar 2015 20:20:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 04, 2015 at 02:05:15PM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Use an SDK branch that slightly tweaks the makefile to include generic
>   optimizations that should be used by all TI platforms.
> * Also manually set certain variables to insure no additional/unexpected
>   compiler optimization are pulled in.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-benchmark/stream/stream_git.bbappend   |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
> 
> diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
> new file mode 100644
> index 0000000..83adfb6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
> @@ -0,0 +1,10 @@
> +PR_append = "-arago0"
> +
> +BRANCH = "sdk"
> +SRCREV = "cfd73a33c0ceef1f8532ce6a71de3bcf9435f6a2"
> +
> +do_compile_prepend() {
> +    #Explicitly set some variables to insure no unexpected optimizations are being passed in.
> +    export CFLAGS="-isystem${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/include"
> +    export LDFLAGS="-L${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${ELT_TARGET_SYS}/lib"

NAK, this assumes external Linaro toolchain. Can you make it more generic? Why 
can't you use the sysroots?

-- 
Denys

