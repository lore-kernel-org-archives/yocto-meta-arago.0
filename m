Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 56A02529D3
	for <meta-arago@arago-project.org>;
	Thu, 25 Jul 2013 20:24:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6PKOox3003208
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:24:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6PKOoLR001041
	for <meta-arago@arago-project.org>; Thu, 25 Jul 2013 15:24:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 25 Jul 2013 15:24:50 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6PKOnYH013787;
	Thu, 25 Jul 2013 15:24:50 -0500
Date: Thu, 25 Jul 2013 16:24:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>
Message-ID: <20130725202449.GD2222@edge>
References: <8EAE6244CE843044A42356038645C8551573CB16@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8EAE6244CE843044A42356038645C8551573CB16@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: compiling a native (x86) application using Yocto
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
X-List-Received-Date: Thu, 25 Jul 2013 20:24:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 24, 2013 at 06:26:48PM +0000, Saran, Sajesh Kumar wrote:
> Hi,
> 
> I am trying to compile a native tool/application using Yocto.
> 
> I have added BBCLASSEXTEND = "native" to the recipe. The compilation goes 
> thru fine. But, in do_package_qa it is running a strip command using 
> arm-linux-gnueabihf-strip, which is failing because the application is 
> compiled using gcc. Do I have to anything else to fix of this issue?

Strange, that should be enough... Care to share the recipe?

-- 
Denys

