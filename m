Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9E89552A12
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 21:21:34 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7LLUVF005007;
	Wed, 7 Nov 2012 15:21:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7LLUOu020829;
	Wed, 7 Nov 2012 15:21:30 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 7 Nov 2012 15:21:29 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA7LLTGe012112;
	Wed, 7 Nov 2012 15:21:29 -0600
Date: Wed, 7 Nov 2012 16:21:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121107212129.GH11967@edge>
References: <1352322311-11941-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1352322311-11941-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH] shadow-securetty: Allow remote telnet login as root
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
X-List-Received-Date: Wed, 07 Nov 2012 21:21:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 07, 2012 at 03:05:11PM -0600, Franklin S. Cooper Jr wrote:
> * Need to add pts/X to the securetty file to allow remote login via telnet as root

Why do we need telnetd and specifically with root login? Isn't sshd not 
enough? Previously telnetd was enabled because we couldn't ship sshd...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../shadow/shadow-securetty_4.1.4.3.bbappend       |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
> 
> diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
> new file mode 100644
> index 0000000..a09c514
> --- /dev/null
> +++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
> @@ -0,0 +1,15 @@
> +PR_append = "-arago0"
> +
> +do_install_append () {
> +    # Allow telnet sessions to login as root
> +    securetty_file=${D}${sysconfdir}/securetty
> +
> +    printf '\n' >> $securetty_file
> +    printf '# Allow 5 telnet login\n' >> $securetty_file
> +    printf 'pts/0\n' >> $securetty_file
> +    printf 'pts/1\n' >> $securetty_file
> +    printf 'pts/2\n' >> $securetty_file
> +    printf 'pts/3\n' >> $securetty_file
> +    printf 'pts/4\n' >> $securetty_file

You don't need to escape anything here, why not simply use "echo"?

> +
> +}
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

