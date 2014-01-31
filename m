Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id CEE925298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 23:11:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VNBZje001849
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:11:35 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNBZ7P020769
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:11:35 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 17:11:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNBYps028614	for
	<meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:11:34 -0600
Date: Fri, 31 Jan 2014 18:11:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140131231133.GO6814@edge>
References: <1391129278-9755-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1391129278-9755-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] oe-layertool-setup.sh: avoid == bashism
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
X-List-Received-Date: Fri, 31 Jan 2014 23:11:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping. Any objections?


On Thu, Jan 30, 2014 at 07:47:58PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Use POSIX "=" for comparison instead of bash "=="
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  oe-layertool-setup.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index ab66ef3..91fb71a 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -742,7 +742,7 @@ EOM
>      fi
>  
>      # If command line option was not set use the old dldir
> -    if [ "x$dldir" == "x" ]
> +    if [ "x$dldir" = "x" ]
>      then
>          dldir=$old_dldir
>      fi
> -- 
> 1.8.3.2
> 

