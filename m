Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B9D71529D3
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 18:12:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06ICqfl026139
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:12:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06ICqDR011954
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:12:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:12:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06ICqbb003306;
	Tue, 6 Jan 2015 12:12:52 -0600
Date: Tue, 6 Jan 2015 13:12:51 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181251.GT4759@edge>
References: <1420553623-19435-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420553623-19435-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-setup-scripts][PATCH] setup-target-nfs: Fix 'chown' arguments for /opt directory.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:12:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Tue, Jan 06, 2015 at 09:13:43AM -0500, Jacob Stiffler wrote:
> * 'chown' command was missing owner:group options.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  setup-targetfs-nfs.sh |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
> index 695f799..d8d6805 100644
> --- a/setup-targetfs-nfs.sh
> +++ b/setup-targetfs-nfs.sh
> @@ -70,7 +70,7 @@ extract_fs() {
>      # Opt isn't a standard Linux directory. First make sure it exist.
>      if [ -d $1/opt ];
>      then
> -            sudo chown -R $1/opt
> +            sudo chown -R $me:$me $1/opt
>              check_status
>      fi
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

