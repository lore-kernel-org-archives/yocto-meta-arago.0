Return-Path: <jose.alarcon@kuviovision.com>
Received: from webmail1.louhi.net (webmail.louhi.net [77.240.18.35])
	by arago-project.org (Postfix) with ESMTP id 5C517529BC
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 08:30:52 +0000 (UTC)
Received: by webmail1.louhi.net (Postfix, from userid 33)
	id 1F8EC19C097; Thu, 30 Jan 2014 10:30:51 +0200 (EET)
To: "Nelson, Sam" <sam.nelson@ti.com>
MIME-Version: 1.0
Date: Thu, 30 Jan 2014 10:30:51 +0200
From: jose.alarcon@kuviovision.com
In-Reply-To: <4F9216F96E5DF9428610502835A9F490549E9CD0@DLEE11.ent.ti.com>
References: <1390871192-3063-1-git-send-email-denis@denix.org>
	<25a2617e42192ee8409b5072a91434b7@kuviovision.com>
	<20140129022615.GK6814@edge>
	<4F9216F96E5DF9428610502835A9F490549E9CD0@DLEE11.ent.ti.com>
Message-ID: <7c8427fe4e9c9ee151dd5f2030b2176d@kuviovision.com>
X-Sender: jose.alarcon@kuviovision.com
User-Agent: Louhi Webmail/0.8.4
Cc: meta-arago@arago-project.org
Subject: Re: ti-mpm-transport broken on MCSDK
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
X-List-Received-Date: Thu, 30 Jan 2014 08:30:53 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

Hello

On 2014-01-30 07:12, Nelson, Sam wrote:
> Jose,
> The mpm-transport recipes were updated for MCSDK 3.0.3 to point to
> DEV.MPM-TRANSPORT-01.00.01.00.
> May be you are looking at the older version of the recipe?
> With regards,
> Sam

Sam, you are right. I see that this was fixed by the following commit:

commit d727d13bc9204fa0e7c3d97b27f8d297d9a0b711
Author: Sam Nelson <sam.nelson@ti.com>
Date:   Thu Jan 2 09:30:14 2014 -0500

     mcsdk-03.00.03.15: Update mcsdk 03.00.03.15 configuration

     - Fix issue with recipes pointing to wrong source url

     Signed-off-by: Sam Nelson <sam.nelson@ti.com>

However I was still using the original version of the mcsdk-3.00.03.15 
configuration file from Nov 26 
(7500e852f77e7a9b12bc8198e87e4bd91362300c)

We clone the MCSDK layers to our internal server each time there is a 
new release. Obviously I missed this fix.

It would be great if you could post an note here (or on the multicore 
e2e community) when some fixes are being made to the current release.

Thanks,

--
Jose

