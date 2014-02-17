Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 3C27D529B6
	for <meta-arago@arago-project.org>;
	Mon, 17 Feb 2014 22:22:11 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N15001MEVGJFQF0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 17 Feb 2014 16:21:55 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1D2FC20173; Mon,
	17 Feb 2014 17:21:55 -0500 (EST)
Date: Mon, 17 Feb 2014 17:21:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <chase.maupin@ti.com>
Message-id: <20140217222155.GV22890@denix.org>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
	<1391106857-17112-7-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1391106857-17112-7-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 06/11] libav: update bbappend to latest version
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
X-List-Received-Date: Mon, 17 Feb 2014 22:22:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 30, 2014 at 12:34:12PM -0600, Chase Maupin wrote:
> * Update the bbappend to the latest libav version
> * New libav also enables x264 which is commercially licensed so
>   filter that out of the PACKAGECONFIG options
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  .../{libav_0.8.4.bbappend => libav_0.8.8.bbappend} |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.4.bbappend => libav_0.8.8.bbappend} (92%)
> 
> diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.4.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
> similarity index 92%
> rename from meta-arago-distro/recipes-multimedia/libav/libav_0.8.4.bbappend
> rename to meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
> index f33cc54..86747f1 100644
> --- a/meta-arago-distro/recipes-multimedia/libav/libav_0.8.4.bbappend
> +++ b/meta-arago-distro/recipes-multimedia/libav/libav_0.8.8.bbappend
> @@ -1,4 +1,6 @@
> -PR_append = "-arago1"
> +PR_append = "-arago0"
> +
> +PACKAGECONFIG := "${@oe_filter_out('x264','${PACKAGECONFIG}', d)}"

Can we just clear LICENSE_FLAGS here (remove commercial) and drop the next 
patch #7?


>  # Disable features that have potential commercial licensing restrictions
>  EXTRA_OECONF += "\
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

