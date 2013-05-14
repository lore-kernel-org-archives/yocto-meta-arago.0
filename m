Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 725EF52981
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 18:24:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMS00LZUWGKRG50@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 May 2013 13:24:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F184520087; Tue,
	14 May 2013 14:24:19 -0400 (EDT)
Date: Tue, 14 May 2013 14:24:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: zhoujt@ti.com
Message-id: <20130514182419.GG31835@denix.org>
References: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
	<1368052202-30076-2-git-send-email-zhoujt@ti.com>
MIME-version: 1.0
In-reply-to: <1368052202-30076-2-git-send-email-zhoujt@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] Added initscript-debugfs to the server-extra packagegroup list
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
X-List-Received-Date: Tue, 14 May 2013 18:24:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 08, 2013 at 06:30:02PM -0400, zhoujt@ti.com wrote:
> From: Jingting Zhou <zhoujt@ti.com>
> 
> Signed-off-by: Jingting Zhou <zhoujt@ti.com>
> ---
>  .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> index 46db7c2..dfc78c2 100755
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb

^^^^^^ There is no such file in meta-arago...


> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -PR = "r7"
> +PR = "r8"
>  
>  inherit packagegroup
>  
> @@ -95,4 +95,5 @@ RDEPENDS_${PN} = "\
>      ti-netapi \
>      ti-ipc \
>      ebtables \
> +    initscript-debugfs \
>  	"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

