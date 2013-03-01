Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 80ED352A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:19:40 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIY00F92P7PHI35@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 28 Feb 2013 21:19:17 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8A78F200DD; Thu,
	28 Feb 2013 22:19:00 -0500 (EST)
Date: Thu, 28 Feb 2013 22:19:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: fcooperjr27@gmail.com
Message-id: <20130301031900.GA28405@denix.org>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
	<1362107447-11234-5-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1362107447-11234-5-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 5/9] meta-toolchain-arago: Create shell stub for gdb
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
X-List-Received-Date: Fri, 01 Mar 2013 03:19:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 28, 2013 at 09:10:43PM -0600, fcooperjr27@gmail.com wrote:
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * PYTHONHOME and PYTHONPATH variable causes various problems in the
>   environment-setup file.
> * Since it is only needed by gdb resurrect the shell stub concept and place
>   those environment variables in there for gdb.

I was thinking would it be any better to rely on a host Python instead of 
bringing our own? Can we extend Python modules on the host with our own, if 
needed, but otherwise use what host provides? Not sure about versions 
though...

-- 
Denys


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb      |   22 +++++++++++++++++++-
>  1 files changed, 21 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 863e0ef..e683f9a 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -5,7 +5,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= ""
>  
>  require recipes-core/meta/meta-toolchain.bb
>  
> -PR = "r19"
> +PR = "r20"
>  
>  SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
>  
> @@ -57,12 +57,32 @@ toolchain_create_sdk_env_script () {
>  	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>  }
>  
> +create_shell_stub () {
> +	i=$1
> +	mv $i $i.real
> +	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
> +	printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> $i
> +	printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> $i
> +	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
> +	printf "fi\n" >> $i
> +
> +	if [ "$2" == "yes" ]; then
> +		echo 'export PYTHONHOME=$SDK_PATH' >> $i
> +		echo 'export PYTHONPATH=lib/python2.7' >> $i
> +	fi
> +	printf "LD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" >> $i
> +	chmod +x $i
> +}
> +
>  populate_sdk_ipk_append () {
>  	# Remove broken .la files
>  	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
>  		rm -f $i
>  	done
>  
> +	cd ${SDK_OUTPUT}/${SDKPATH}/bin
> +	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', '', 'create_shell_stub ${TARGET_PREFIX}gdb yes', d)}
> +
>  	cleanup_toolchain_packages
>  
>  	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

