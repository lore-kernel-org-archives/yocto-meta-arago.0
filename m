Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6A74652A88
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 18:36:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58Ia7Md023891
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:36:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58Ia7hR021846
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:36:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 13:36:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58Ia7kP023895;
	Mon, 8 Jun 2015 13:36:07 -0500
Date: Mon, 8 Jun 2015 14:35:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150608183551.GE32398@edge>
References: <1433788340-3674-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1433788340-3674-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] processor-sdk-daisy-config: Freeze meta-qt5 layer to stay at QT 5.4.1
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
X-List-Received-Date: Mon, 08 Jun 2015 18:36:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 08, 2015 at 02:32:20PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../processor-sdk/processor-sdk-daisy-config.txt   |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
> index 63a5e27..61c8a59 100644
> --- a/configs/processor-sdk/processor-sdk-daisy-config.txt
> +++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
> @@ -4,7 +4,7 @@
>  bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
>  meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
>  meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
> -meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,5ebbfedbc72452d2de18ce1557a36f3ba8b1175f,layers=

There's one more commit after that with CLEANBROKEN - doesn't seem to affect 
us, but why not include it too?


>  meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
>  meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

