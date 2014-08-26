Return-Path: <aja@survision.fr>
Received: from mo1.mail-out.ovh.net (8.mo1.mail-out.ovh.net [178.33.110.239])
	by arago-project.org (Postfix) with ESMTP id 0BB9852A69
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 13:57:39 +0000 (UTC)
Received: from mail140.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 77B63FF9F1E
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 15:57:38 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Aug 2014 15:57:38 +0200
Received: from laubervilliers-656-01-35-73.w217-128.abo.wanadoo.fr (HELO
	?192.168.50.78?) (arnaud.janvier@survision.fr@217.128.91.73)
	by ns0.ovh.net with SMTP; 26 Aug 2014 15:57:36 +0200
Message-ID: <53FC924D.3070901@survision.fr>
Date: Tue, 26 Aug 2014 15:57:33 +0200
From: Arnaud Janvier <aja@survision.fr>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <53F6E737.4080208@survision.fr> <20140823033040.GA23523@edge>
In-Reply-To: <20140823033040.GA23523@edge>
X-Ovh-Tracer-Id: 10542926729280013507
X-Ovh-Remote: 217.128.91.73
	(laubervilliers-656-01-35-73.w217-128.abo.wanadoo.fr)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejgedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejgedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: Re: [PATCH] binutils: Fix documentation build error with Texinfo 5
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
X-List-Received-Date: Tue, 26 Aug 2014 13:57:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/08/2014 05:30, Denys Dmytriyenko a écrit :
>
> What branch is it for? There's no longer binutils-2.20.1 in latest meta-arago.
> If it's for Dora, I can probably apply it there. If it's for AMSDK 7.0, it
> should be applied to Dylan, but I'm not sure there will be a point release to
> pick it up...

You are right, I forgot to mention that: patch was created for the Dylan 
branch and will hopefully be taken in a future AMSDK release.

I also verified on Dora branch today and even if binutils 2.20.1 still 
exists there, it seems that it is now taken directly from oe-core as 
2.23.2 was built. So apparently no reason to apply it there.


Regards,
Arnaud

>
> On Fri, Aug 22, 2014 at 08:46:15AM +0200, Arnaud Janvier wrote:
>> Newer versions of Texinfo have problems to build binutils documentation.
>> This patch fixes the build issue seen on Ubuntu 14.04 distribution.
>> ---
>>   .../binutils-2.20.1/binutils-texinfo-5.0.patch     | 42
>> ++++++++++++++++++++++
>>   .../recipes-devtools/binutils/binutils_2.20.1.bb   |  1 +
>>   2 files changed, 43 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
>>
>> diff --git a/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
>> new file mode 100644
>> index 0000000..7de8e55
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
>> @@ -0,0 +1,42 @@
>> +diff -Nru binutils-2.20.1.orig/bfd/doc/bfd.texinfo
>> binutils-2.20.1/bfd/doc/bfd.texinfo
>> +--- binutils-2.20.1.orig/bfd/doc/bfd.texinfo	2009-09-02
>> 09:18:38.000000000 +0200
>> ++++ binutils-2.20.1/bfd/doc/bfd.texinfo	2014-06-05 08:51:35.897319775 +0200
>> +@@ -323,7 +323,7 @@
>> + @printindex cp
>> + + @tex
>> +-% I think something like @colophon should be in texinfo.  In the
>> ++% I think something like @@colophon should be in texinfo.  In the
>> + % meantime:
>> + \long\def\colophon{\hbox to0pt{}\vfill
>> + \centerline{The body of this manual is set in}
>> +@@ -334,7 +334,7 @@
>> + \centerline{{\sl\fontname\tensl\/}}
>> + \centerline{are used for emphasis.}\vfill}
>> + \page\colophon
>> +-% Blame: doc@cygnus.com, 28mar91.
>> ++% Blame: doc@@cygnus.com, 28mar91.
>> + @end tex
>> + + @bye
>> +diff -Nru binutils-2.20.1.orig/ld/ld.texinfo binutils-2.20.1/ld/ld.texinfo
>> +--- binutils-2.20.1.orig/ld/ld.texinfo	2014-06-05 09:26:41.049356076 +0200
>> ++++ binutils-2.20.1/ld/ld.texinfo	2014-06-04 18:10:49.305840598 +0200
>> +@@ -7521,7 +7521,7 @@
>> + @printindex cp
>> + + @tex
>> +-% I think something like @colophon should be in texinfo.  In the
>> ++% I think something like @@colophon should be in texinfo.  In the
>> + % meantime:
>> + \long\def\colophon{\hbox to0pt{}\vfill
>> + \centerline{The body of this manual is set in}
>> +@@ -7532,7 +7532,7 @@
>> + \centerline{{\sl\fontname\tensl\/}}
>> + \centerline{are used for emphasis.}\vfill}
>> + \page\colophon
>> +-% Blame: doc@cygnus.com, 28mar91.
>> ++% Blame: doc@@cygnus.com, 28mar91.
>> + @end tex
>> + + @bye
>> diff --git
>> a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
>> b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
>> index d0f889c..dd7e640 100644
>> --- a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
>> +++ b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
>> @@ -34,6 +34,7 @@ SRC_URI = "\
>>        file://200_elflink_%B_fixes.patch \
>>        file://201_elflink_improve_noaddneeded_errors.patch \
>>        file://202_elflink_noaddneeded_vs_weak.patch \
>> +     file://binutils-texinfo-5.0.patch \
>>        "
>>    SRC_URI[md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
>> --
>> 1.9.1
>>
>>
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


