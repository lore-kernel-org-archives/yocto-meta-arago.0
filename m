Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4436852A83
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 20:00:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TK06lx014475
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:00:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK05Ht018074
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:00:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:00:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK04ar019545;
	Fri, 29 May 2015 15:00:04 -0500
Date: Fri, 29 May 2015 16:00:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529200003.GR16418@edge>
References: <1432823192-6273-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432823192-6273-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] processor-sdk-daisy-config: Bump bitbake to 1.26, point meta-arago to daisy branch.
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
X-List-Received-Date: Fri, 29 May 2015 20:00:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 10:26:32AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../processor-sdk/processor-sdk-daisy-config.txt   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
> index ffd8e0f..63a5e27 100644
> --- a/configs/processor-sdk/processor-sdk-daisy-config.txt
> +++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
> @@ -1,9 +1,9 @@
>  # This file takes repo entries in the format
>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>  
> -bitbake,git://git.openembedded.org/bitbake,1.24,HEAD,layers=
> +bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
>  meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
> -meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
> +meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
>  meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
>  meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

