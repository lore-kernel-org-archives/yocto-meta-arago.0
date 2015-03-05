Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1016152A62
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 19:57:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25Jv5qA016591
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:57:05 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25Jv47m003327
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 13:57:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 13:57:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25Jv3o8019138;
	Thu, 5 Mar 2015 13:57:03 -0600
Date: Thu, 5 Mar 2015 14:57:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150305195702.GY6052@edge>
References: <4B26FB5A64EBA14C87266869E037F958141056F9@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958141056F9@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: process
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
X-List-Received-Date: Thu, 05 Mar 2015 19:57:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can we avoid creating another image recipe? Why do we need a separate amsdk 
image in the first place? Just the name?


On Thu, Mar 05, 2015 at 02:38:26PM -0500, Stiffler, Jacob wrote:
>    Denys, Franklin,
> 
>     
> 
>    Soon, I am going to be submitting a patch to a the
>    `processor-sdk-linux-image' image. This will be based off of the
>    `arago-amsdk-image'.
> 
>     
> 
>    One question I have, as I am not aware of the history, is for the
>    following line:
> 
>     
> 
>    DEPLOY_SPL_NAME_omapl138 = ""
> 
>     
> 
>     
> 
>    Would there be any reason for me to retain this in the
>    processor-sdk-linux-image?
> 
>     
> 
>    Thank you,
> 
>    Jake

