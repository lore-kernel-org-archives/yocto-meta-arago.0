Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1110652991;
	Fri, 24 Jul 2015 13:56:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6ODu1b1007756;
	Fri, 24 Jul 2015 08:56:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6ODu1cb012932;
	Fri, 24 Jul 2015 08:56:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Jul 2015 08:56:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6ODu1pD012441;
	Fri, 24 Jul 2015 08:56:01 -0500
Date: Fri, 24 Jul 2015 09:55:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20150724135545.GS1040@edge>
References: <1D5CE803A5355E429159F7C8EE54EE51051A1295@HIKAWSEXMB01.ad.harman.com>
	<55B2217A.5010309@ti.com>
MIME-Version: 1.0
In-Reply-To: <55B2217A.5010309@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Batth,
	Gurpreet \(Global Edge\)" <Gurpreet.Batth@harman.com>,
	"opentest@arago-project.org" <opentest@arago-project.org>
Subject: Re: [opentest] Compile time error "start.S:119: undefined reference to `main'"
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
X-List-Received-Date: Fri, 24 Jul 2015 13:56:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

As indicated earlier in the log:

MACHINE           = "iukram"

But, ltp-ddt takes MACHINE and passes it down as PLATFORM and has a predefined 
list of supported platforms, so "iukram" is not in that list, hence the error.

-- 
Denys


On Fri, Jul 24, 2015 at 07:28:58AM -0400, Carlos Hernandez wrote:
> Hi Gurpreet,
> 
> It seems like you are not passing the MACHINE to build ltp-ddt for.
> Please use meta-arago@arago-project.org for issues building
> Yocto/OpenEmbedded recipes.
> 
> Carlos
> On 07/24/2015 02:33 AM, Batth, Gurpreet (Global Edge) wrote:
> >
> >Hi Team!
> >
> >Greetings!
> >
> >I am new to ltp-ddt, I am trying to compile it for arm target, I
> >am using Ubuntu 14.04.1 LTS (i686) as a host. I am facing below
> >error while comiling.
> >
> >| /home/b_lal/elina-distro/build-iuk-ram/tmp/sysroots/iukram/usr/lib/crt1.o*:
> >In function `_start':*
> >
> >| /home/b_lal/elina-distro/build-iuk-ram/tmp/work/cortexa8t2hf-vfp-neon-elina-linux-gnueabi/glibc/2.20-r0/git/csu/../sysdeps/arm/*start.S:119:
> >undefined reference to `main'*
> >
> >| *collect2: error: ld returned 1 exit status*
> >
> >**
> >
> >I have attached the logs file Console logs.
> >
> >Regards,
> >
> >Gurpreet
> >
> >
> >
> >_______________________________________________
> >opentest mailing list
> >opentest@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/opentest
> 

> _______________________________________________
> opentest mailing list
> opentest@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/opentest


