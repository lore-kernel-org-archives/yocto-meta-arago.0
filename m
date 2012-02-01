Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id BDB3052A6F
	for <meta-arago@arago-project.org>;
	Wed,  1 Feb 2012 06:18:28 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYP00ANXAURDYSD@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 01 Feb 2012 00:18:28 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C8C53201C0; Wed,
	01 Feb 2012 01:18:27 -0500 (EST)
Date: Wed, 01 Feb 2012 01:18:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120201061827.GH5169@denix.org>
References: <1328040848-29090-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1328040848-29090-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] qt4-embedded: append qt4-embedded LICENSE setting
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
X-List-Received-Date: Wed, 01 Feb 2012 06:18:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 31, 2012 at 02:14:08PM -0600, Chase Maupin wrote:
> * Append the qt4-embedded LICENSE field to LGPLv2.1 to reflect
>   the license we are distributing this under.
> * This is similar to the amend used in the old arago overlay
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../qt4/qt4-embedded_4.8.0.bbappend                |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend

I'm still not convinced about recipes-bbappends. What do you see are the 
benefits? Are you afraid of losing track of .bbappends among real recipes? 
There are tools for that, such as bitbake-layers.

Qt recipes live in recipes-qt/qt4 in OE-Core and corresponding bbappends in 
meta-oe are at the same location. Why do we need a different one for Arago? 
bitbake-layers would allow you to examine the recipe overlaying and 
modifications from .bbappends...

-- 
Denys


> diff --git a/meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend b/meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend
> new file mode 100644
> index 0000000..462a746
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bbappends/qt4/qt4-embedded_4.8.0.bbappend
> @@ -0,0 +1,5 @@
> +# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> +# For our distribution purposes we only use LGPLv2.1
> +LICENSE = "LGPLv2.1"
> +
> +PR_append = "-arago1"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

