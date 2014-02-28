Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id C962952986
	for <meta-arago@arago-project.org>;
	Fri, 28 Feb 2014 20:10:56 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1Q00G1D2PDCCI0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 28 Feb 2014 14:10:41 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 836D020396; Fri,
	28 Feb 2014 15:10:25 -0500 (EST)
Date: Fri, 28 Feb 2014 15:10:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <chase.maupin@ti.com>
Message-id: <20140228201025.GA22890@denix.org>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
	<1391197703-29424-2-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1391197703-29424-2-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] arago-prefs: set PREFERRED VERSION of libdrm to latest
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
X-List-Received-Date: Fri, 28 Feb 2014 20:10:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jan 31, 2014 at 01:48:23PM -0600, Chase Maupin wrote:
> * Set the PREFERRED_VERSION of libdrm to the latest available in
>   openembedded core by default.
> * This will allow using a version of libdrm that will support
>   the latest TI devices
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 20c6a63..e417585 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -4,6 +4,9 @@ include conf/distro/include/qt5-versions.inc
>  # Use the latest version of ltp-ddt for kernel versions 3.8+
>  PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
>  
> +# User the latest version of libdrm
> +PREFERRED_VERSION_libdrm = "2.4.46"

Was this meant for dora and up? As dylan only has 2.4.42 version in oe-core... 
Just noticed the warning about 2.4.46 not being available. Was this change 
required for our release and will it work with 2.4.42, which we end up 
building anyway?


>  PREFERRED_PROVIDER_virtual/gettext = "gettext"
>  
>  ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

