Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0012952A5F
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 19:23:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84JNNVs023748
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 14:23:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84JNNeG020307
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 14:23:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 14:23:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84JNMNC020683;
	Thu, 4 Sep 2014 14:23:22 -0500
Date: Thu, 4 Sep 2014 15:23:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20140904192322.GU18620@edge>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
	<1409851868-7389-3-git-send-email-j-stiffler@ti.com>
	<20140904173842.GL18620@edge>
	<4B26FB5A64EBA14C87266869E037F958140B10AE@DFLE09.ent.ti.com>
	<20140904190305.GR18620@edge>
	<8F29D6B095ED194EA1980491A5E029710C728CB1@DFLE08.ent.ti.com>
	<4B26FB5A64EBA14C87266869E037F958140B11A9@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958140B11A9@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [tisdk-build-scripts][PATCH 3/4] bitbake-test-sdk-image: Add support to control verbosity of build logging.
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
X-List-Received-Date: Thu, 04 Sep 2014 19:23:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 04, 2014 at 03:19:37PM -0400, Stiffler, Jacob wrote:
> >>>
> [Franklin] Took me awhile to realize we never actually do anything with that 
> build-log file.
> Jacob,
> 
> How are you uploading your builds to your server? We don't upload this log 
> file so having your patch upload that file also along with the results file 
> would make things very useful for all of us.
>  <<<
> 
> The upload to the archive server is done by our common Jenkins scripts 
> (which are responsible for creating a VM, generating the results email, 
> etc...). I am simply copying the $LOG_DIR to the location that will get 
> copied. We have a single tarbal (artifacts.tar.gz) which will get uploaded 
> to this server.
> 
> If your are interested, in our build wrapper, I also implemented a way to 
> parse the logs to get the recipe that caused an error and copy the 
> appropriate error log to the $LOG_DIR.

Can we implement that part here in tisdk-build-scripts? The icing on the cake 
wwould be to link individual machine logs from the main results.html log and 
email - I'd be willing to provide space on arago-project.org for the logs, so 
one can simply click on the FAILED status and open up the corrspoding build 
log to ivestigate!

-- 
Denys


> -----Original Message-----
> From: Cooper Jr., Franklin 
> Sent: Thursday, September 04, 2014 3:09 PM
> To: Dmytriyenko, Denys; Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [tisdk-build-scripts][PATCH 3/4] bitbake-test-sdk-image: Add support to control verbosity of build logging.
> 
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago- 
> > bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> > Sent: Thursday, September 04, 2014 2:03 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 3/4] 
> > bitbake-test-sdk-
> > image: Add support to control verbosity of build logging.
> > 
> > On Thu, Sep 04, 2014 at 02:05:01PM -0400, Stiffler, Jacob wrote:
> > > This change is to capture stderr and stdout to a file. I could not 
> > > find anywhere that the stderr and stdout of the bitbake command was 
> > > logged.  From what I see, results.html only shows the configuration 
> > > parameters. In the log directory, the $m-build-log.txt only contains 
> > > a single line: " executing bitbake command arago-amsdk-image for 
> > > machine
> > am57xx-evm".
> > 
> > Yes, you are right, it's captured by Jenkins, not results.html...
> > I've been meaning to add the per-machine logs to the output and email, 
> > but never had time. This basically makes it possible - thanks!
> [Franklin] Took me awhile to realize we never actually do anything with that build-log file.
> Jacob,
> 
> How are you uploading your builds to your server? We don't upload this log file so having your patch upload that file also along with the results file would make things very useful for all of us.                                                                                                                                                                             
> > 
> > 
> > > Without this, the only place I can find the complete log is the 
> > > Jenkins console in a browser window. Here is an example of what I 
> > > would like to enable with this change:
> > > http://158.218.103.230/nightly_builds/mcsdk-8.0.x/75-2014-09-03_13-1
> > > 6-
> > 59/artifacts/logs/log-files/am57xx-evm-build-log.txt
> > >
> > >
> > >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Thursday, September 04, 2014 1:39 PM
> > > To: Stiffler, Jacob
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 3/4] 
> > > bitbake-test-
> > sdk-image: Add support to control verbosity of build logging.
> > >
> > > Can you please elaborate on this change? You don't seem to be 
> > > increasing
> > Bitbake's verbosity level, just enabling capturing stdout and stderr 
> > into a file, which gets captured by results.html anyway. What's the purpose?
> > >
> > >
> > > On Thu, Sep 04, 2014 at 01:31:07PM -0400, Jacob Stiffler wrote:
> > > > * Setting BUILD_LOG_VERBOSE="true" (case sensitive) will enable
> > logging stdout
> > > >   and stderr for the bitbake command to the build log.
> > > >
> > > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > > ---
> > > >  lib/oesdk/bitbake-test-sdk-image |    8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/lib/oesdk/bitbake-test-sdk-image
> > > > b/lib/oesdk/bitbake-test-sdk-image
> > > > index cff86e4..7d8d093 100644
> > > > --- a/lib/oesdk/bitbake-test-sdk-image
> > > > +++ b/lib/oesdk/bitbake-test-sdk-image
> > > > @@ -375,12 +375,16 @@ bitbake_sdk_images(){
> > > >          for c in "${bitbake_command_list[@]}"
> > > >          do
> > > >              log $machine_build_log echo "executing bitbake 
> > > > command $c for
> > machine $m"
> > > > -            MACHINE=$m
> > EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}"
> > TISDK_VERSION="${TISDK_VERSION}" bitbake $c
> > > > +            if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
> > > > +                MACHINE=$m
> > EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}"
> > TISDK_VERSION="${TISDK_VERSION}" bitbake $c 2>&1 | eval tee -a 
> > $machine_build_log
> > > > +            else
> > > > +                MACHINE=$m
> > EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}"
> > TISDK_VERSION="${TISDK_VERSION}" bitbake $c
> > > > +            fi
> > > >
> > > >              # Check the return status of the build process.  If 
> > > > the build
> > returned
> > > >              # a non-zero exit value then log the failure and continue (without
> > > >              # testing).  A lack of a test file will indicate a test skip
> > > > -            if [ "$?" != "0" ]
> > > > +            if [ "${PIPESTATUS[0]}" != "0" ]
> > > >              then
> > > >                  echo "FAILED" > $LOG_DIR/$m-build-result.txt
> > > >                  build_status="fail"
> > > > --
> > > > 1.7.9.5
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

