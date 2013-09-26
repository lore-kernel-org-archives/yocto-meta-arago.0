Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4CB745299B
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 20:19:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QKJS2Q001793
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 15:19:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QKJSx6016663
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2013 15:19:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 26 Sep 2013 15:19:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
Thread-Index: AQHOuvMAsnie7ylq/E+cD/8wo+NX95nYdJIQgABUooD//6xCcA==
Date: Thu, 26 Sep 2013 20:19:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159753C6B@DLEE11.ent.ti.com>
References: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C55CF17@DFLE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8B1DE5@DLEE08.ent.ti.com>
	<20130926200008.GA16261@edge>
	<7D46E86EC0A8354091174257B2FED10159753BA5@DLEE11.ent.ti.com>
	<20130926201902.GB16261@edge>
In-Reply-To: <20130926201902.GB16261@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper
	Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Thu, 26 Sep 2013 20:19:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yep.  That is the fix I'm testing now

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Thursday, September 26, 2013 3:19 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
>Subject: Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh:
>properly set DL_DIR
>
>Correct. You should probably not remove the old default:
>
>> dldir=3D"$oebase/downloads"
>
>Denys
>
>
>On Thu, Sep 26, 2013 at 04:16:23PM -0400, Maupin, Chase wrote:
>> Let me check.  So no existing local.conf and no -d option?
>>
>> Sincerely,
>> Chase Maupin
>> Integration Team Manager
>> Linux Core Product Development
>> e-mail: chase.maupin@ti.com
>> phone: (214) 567-2950
>>
>> For support:
>> Forums - http://community.ti.com/forums/
>> Wiki - http://wiki.davincidsp.com/
>>
>>
>> >-----Original Message-----
>> >From: Dmytriyenko, Denys
>> >Sent: Thursday, September 26, 2013 3:00 PM
>> >To: Maupin, Chase; meta-arago@arago-project.org; Cooper Jr.,
>> >Franklin
>> >Subject: Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh:
>> >properly set DL_DIR
>> >
>> >I believe there is a bug introduced by this patch - DL_DIR
>doesn't
>> >get set
>> >with default on first run when no -d option is specified...
>> >
>> >
>> >On Tue, Sep 24, 2013 at 04:18:11PM -0400, Dmytriyenko, Denys
>> >wrote:
>> >>    Ack
>> >>
>> >>    Denys
>> >>
>> >>    -----Original Message-----
>> >>    From: Cooper Jr., Franklin [fcooper@ti.com]
>> >>    Received: Tuesday, 24 Sep 2013, 16:10
>> >>    To: Maupin, Chase [chase.maupin@ti.com]; meta-arago@arago-
>> >project.org
>> >>    [meta-arago@arago-project.org]
>> >>    Subject: Re: [meta-arago] [PATCHv2] oe-layertool-setup.sh:
>> >properly set
>> >>    DL_DIR
>> >>
>> >>    Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
>> >>
>> >>    > -----Original Message-----
>> >>    > From: meta-arago-bounces@arago-project.org [mailto:meta-
>> >arago-
>> >>    > bounces@arago-project.org] On Behalf Of Maupin, Chase
>> >>    > Sent: Tuesday, September 24, 2013 3:50 PM
>> >>    > To: meta-arago@arago-project.org
>> >>    > Subject: [meta-arago] [PATCHv2] oe-layertool-setup.sh:
>> >properly set
>> >>    DL_DIR
>> >>    >
>> >>    > * This script took a parameter using -d to set the
>DL_DIR
>> >but
>> >>    >   ignored that setting.  Now if that is set make it the
>> >DL_DIR
>> >>    >   value in conf/local.conf
>> >>    > * When running this script to get updates changes that
>were
>> >made
>> >>    >   to DL_DIR were lost because local.conf was copied
>over.
>> >Now
>> >>    >   the script will use the old DL_DIR setting.
>> >>    >
>> >>    > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> >>    >
>> >>    > ---
>> >>    > * Updated in version 2
>> >>    >     * Removed sh -x setting which was accidentally left
>> >over
>> >>    >     * Fixed typo in commit message
>> >>    > ---
>> >>    >  oe-layertool-setup.sh |   17 ++++++++++++++++-
>> >>    >  1 files changed, 16 insertions(+), 1 deletions(-)
>> >>    >
>> >>    > diff --git a/oe-layertool-setup.sh b/oe-layertool-
>setup.sh
>> >index
>> >>    > 55cd174..72e36a2 100755
>> >>    > --- a/oe-layertool-setup.sh
>> >>    > +++ b/oe-layertool-setup.sh
>> >>    > @@ -732,6 +732,22 @@ EOM
>> >>    >      threads=3D`cat /proc/cpuinfo | grep -c processor`
>> >>    >      sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE =3D \"-j
>> >${threads}\"/"
>> >>    > $confdir/local.conf
>> >>    >      sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS =3D
>> >>    > \"${threads}\"/" $confdir/local.conf
>> >>    > +
>> >>    > +    # Find if old DL_DIR was set
>> >>    > +    if [ -e $confdir/local.conf.bak ]
>> >>    > +    then
>> >>    > +        old_dldir=3D`cat $confdir/local.conf.bak | grep -
>e
>> >"^DL_DIR =3D" |
>> >>    sed
>> >>    > 's|DL_DIR =3D ||' | sed 's/"//g'`
>> >>    > +    else
>> >>    > +        old_dldir=3D"$dldir"
>> >>    > +    fi
>> >>    > +
>> >>    > +    # If command line option was not set use the old
>dldir
>> >>    > +    if [ "x$dldir" =3D=3D "x" ]
>> >>    > +    then
>> >>    > +        dldir=3D$old_dldir
>> >>    > +    fi
>> >>    > +
>> >>    > +    sed -i "s|^DL_DIR.*|DL_DIR =3D \"${dldir}\"|"
>> >$confdir/local.conf
>> >>    >  }
>> >>    >
>> >>    >
>> >>    > @@ -838,7 +854,6 @@ cd -
>> >>    >  sourcedir=3D"$oebase/sources"
>> >>    >  builddir=3D"$oebase/build"
>> >>    >  confdir=3D"$builddir/conf"
>> >>    > -dldir=3D"$oebase/downloads"
>> >>    >
>> >>    >  check_input
>> >>    >
>> >>    > --
>> >>    > 1.7.0.4
>> >>    >
>> >>    > _______________________________________________
>> >>    > meta-arago mailing list
>> >>    > meta-arago@arago-project.org
>> >>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>> >arago
>> >>    _______________________________________________
>> >>    meta-arago mailing list
>> >>    meta-arago@arago-project.org
>> >>    http://arago-project.org/cgi-bin/mailman/listinfo/meta-
>arago

