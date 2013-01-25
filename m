Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 161EA52AB1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 19:33:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MH7008TI4YU6W90@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 25 Jan 2013 13:33:09 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 14B8F201A7; Fri,
	25 Jan 2013 14:32:53 -0500 (EST)
Date: Fri, 25 Jan 2013 14:32:53 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20130125193253.GE23977@denix.org>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
	<1359037281-12610-9-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1359037281-12610-9-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 40/47] meta-toolchain-arago: Substitute dirname statement
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
X-List-Received-Date: Fri, 25 Jan 2013 19:33:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 24, 2013 at 08:21:14AM -0600, Franklin S. Cooper Jr wrote:
> * On 32bit systems, the dirname statement sometimes return an empty string.
> * Replace dirname with several statements that provide the same result.

I know we discussed it before, but I'm still having a hard time comprehending 
the issue and the proposed "fix"... Why is it affecting only 32bit systems and 
why is it happening only sometimes? What are the other factors? And why 
splitting it in several lines instead of one "fixes" the problem?

Have you looked into it some more to understand the actual root cause?

-- 
Denys


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |    9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index a9d07b6..332fe48 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r13"
> +PR = "r14"
>  
>  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
>  
> @@ -59,7 +59,12 @@ toolchain_create_sdk_env_script () {
>  create_shell_stub () {
>  	i=$1
>  	mv $i $i.real
> -	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t. \x60dirname \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > $i
> +	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
> +	printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> $i
> +	printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> $i
> +	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
> +	printf "fi\n" >> $i
> +
>  	if [ "$2" == "yes" ]; then
>  		echo 'export PYTHONHOME=$SDK_PATH' >> $i
>  		echo 'export PYTHONPATH=lib/python2.7' >> $i
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

