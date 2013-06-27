Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 24EE7529B0
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 14:33:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5REX4LZ008109
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 09:33:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5REX3qv015230
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 09:33:04 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 09:33:03 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5REX3fF007861;
	Thu, 27 Jun 2013 09:33:03 -0500
Date: Thu, 27 Jun 2013 10:33:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20130627143302.GM28379@edge>
References: <CF956B779D819D41BBC043B7082161D543CF0A@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D543CF0A@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Help needed- error locating kernel headers
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
X-List-Received-Date: Thu, 27 Jun 2013 14:33:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 27, 2013 at 01:28:46PM +0000, Hingolikar, Mrinmayee wrote:
> Hi all,
> 
> I am trying to create a recipe for a firmware that includes some of the 
> kernel header files.
> I have these headers present in the sysroots directory, but still the build 
> fails saying unable to locate these header files.
> 
> In the asocfw.inc file I have :
> EXTRA_OECONF += "$(STAGING_KERNEL_DIR)"

EXTRA_OECONF is a variable that is passed to ./configure script. You are just 
adding a directory to that variable. Are you sure it will work if you do:

./configure /some/path/here


In most cases you want EXTRA_OEMAKE = "KDIR=${STAGING_KERNEL_DIR}"

And you'd definitely want to inherit module

BTW, those are curly brackets, not parentheses...


> Any suggestions? I have attached the error log for more details.
> 
> Regards,
> Mrinmayee
> 


> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


