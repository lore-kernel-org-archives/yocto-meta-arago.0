Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 299CD5299C
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2013 17:41:48 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MRS00HQ1H5NPHK2@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 19 Aug 2013 12:41:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3493420091; Mon,
	19 Aug 2013 13:41:47 -0400 (EDT)
Date: Mon, 19 Aug 2013 13:41:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
Message-id: <20130819174147.GD32524@denix.org>
References: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
MIME-version: 1.0
In-reply-to: <1376891490-10099-1-git-send-email-mrinmayee@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCHv2 0/2] Enable oe-layertool-setup.sh to use GLSDK branding
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
X-List-Received-Date: Mon, 19 Aug 2013 17:41:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Overall, both patches look fine. There are some small nit picks, but I won't 
hold the patches because of those...


On Mon, Aug 19, 2013 at 11:21:28AM +0530, Mrinmayee Hingolikar wrote:
> v1:
> 
>  * In order to use GLSDK branding, a variable ARAGO_BRAND needs to be set
>   in local.conf.
>  * This patch set adds a conf.sample file for GLDK that contains the
>   ARAGO_BRAND set to GLSDK branding, and edits the OECORELOCALCONF
>   variable in GLSDK config to pick up the GLSDK conf.sample.
>  * The oe-layertool-setup.sh would generate local.conf from the GLSDK conf.sample.
> 
> v2:
>  
>  * Copied conf.sample from AMSDK's conf.sample instead of copying from 
>    local-arago-linaro.conf.sample.
> 
> Mrinmayee Hingolikar (2):
>   configs : Override OECORELOCALCONF to use the glsdk.conf.sample
>   sample-files: Added conf.sample file for GLSDK
> 
>  configs/glsdk/glsdk-06.01.00-config.txt |    2 +-
>  sample-files/local-glsdk.conf.sample    |  162 +++++++++++++++++++++++++++++++
>  2 files changed, 163 insertions(+), 1 deletion(-)
>  create mode 100644 sample-files/local-glsdk.conf.sample
> 
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

