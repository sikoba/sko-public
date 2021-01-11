/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

const React = require("react");

class HomeSplash extends React.Component {
  render() {
    const { siteConfig, language = "" } = this.props;
    const { baseUrl, docsUrl } = siteConfig;
    const docsPart = `${docsUrl ? `${docsUrl}/` : ""}`;
    const langPart = `${language ? `${language}/` : ""}`;
    const docUrl = (doc) => `${baseUrl}${docsPart}${langPart}${doc}`;

    const SplashContainer = (props) => (
      <div className="homeContainer">
        <div className="homeSplashFade">
          <div className="wrapper homeWrapper">{props.children}</div>
        </div>
      </div>
    );

    const ProjectTitle = (props) => (
      <h2 className="projectTitle">
        {props.title}
        {/* <small>{props.tagline}</small> */}
      </h2>
    );

    const PromoSection = (props) => (
      <div className="section promoSection">
        <div className="promoRow">
          <div className="pluginRowBlock">{props.children}</div>
        </div>
      </div>
    );

    const Button = (props) => (
      <div className="pluginWrapper buttonWrapper">
        <a className="button" href={props.href} target={props.target}>
          {props.children}
        </a>
      </div>
    );

    const TextCenter = (props) => (
      <div className="text-center">{props.children}</div>
    );

    return (
      <SplashContainer>
        <div className="inner">
          <ProjectTitle tagline={siteConfig.tagline} title={siteConfig.title} />
          <PromoSection>
            <Button href={docUrl("overview.html")}>Mobile App Docs</Button>
            <Button href={docUrl("web/start.html")}>Web App Docs</Button>
          </PromoSection>
          <h1>Welcome Betatesters!</h1>
          <TextCenter>
            Testing sikobaPay only makes sense if you know other users, so
            please make sure to invite people you know. You can also join the
            <a href="https://t.me/sikobaPay_BETATESTERS" target="_blank">
              {" "}
              betatesters Telegram channel
            </a>{" "}
            where you can find other users to connect with. Also please join our{" "}
            <a href="https://t.me/sikobaNetwork" target="_blank">
              {" "}
              main Telegram channel.
            </a>
          </TextCenter>
          <TextCenter>
            Note that any transactions done during beta testing may be deleted
            from the system at some stage in the future.
          </TextCenter>

          <h2>Download sikobaPay mobile app</h2>
          <a
            href="https://play.google.com/store/apps/details?id=com.sikoba.dev&hl=en"
            target="_blank"
          >
            <img src={`${baseUrl}img/google.png`} width="200px" />
          </a>
          <a href="https://testflight.apple.com/join/QHSIF1HF" target="_blank">
            <img src={`${baseUrl}img/apple.png`} width="200px" />
          </a>
          <div>
            <i>
              Note for iOS app: you may need to install the TestFlight app
              first.
            </i>
          </div>

          <h2>Test sikobaPay web app</h2>
          <div style={{ marginBottom: "7vh" }}>
            <Button href="http://web.sikoba.com/">Web App</Button>
          </div>

          <TextCenter>
            <b style={{ fontSize: "1.5rem" }}>IMPORTANT: </b>To participate in
            beta testing, you need a <b>beta key</b>. This can be obtained
            easily just by sending an email (with any content, even an empty
            email will do) to{" "}
            <a href="mailto: betatesters@sikoba.com">betatesters@sikoba.com</a>.
          </TextCenter>

          <h2>Rewards</h2>
          <TextCenter>
            Beta testers who will provide us with some useful feedback, as well
            as those who help to improve our user documentation, will receive
            the rewards.
          </TextCenter>
          <TextCenter>
            We will also reward people for helping us with the translation of
            the app interface. If you are eager to help, get in touch with our
            admins on the{" "}
            <a href="https://t.me/sikobaNetwork" target="_blank">
              {" "}
              Telegram channel.
            </a>
          </TextCenter>

          <h2>Comments/feedback</h2>
          <TextCenter>
            Add your comments/feedback{" "}
            <a
              href="https://docs.google.com/document/d/1s1GlLayWrfCgDMhhaJDYvfQgqExMekCaLeluI8udjhE/edit#heading=h.t1z67zjewsrt"
              target="_blank"
            >
              here
            </a>{" "}
            or send an email to{" "}
            <a href="mailto: feedback@sikoba.com">feedback@sikoba.com</a>.
          </TextCenter>
          <PromoSection>
            <Button href={docUrl("overview.html")}>Mobile App Docs</Button>
            <Button href={docUrl("web/start.html")}>Web App Docs</Button>
          </PromoSection>
        </div>
      </SplashContainer>
    );
  }
}

class Index extends React.Component {
  render() {
    const { config: siteConfig, language = "" } = this.props;

    return <HomeSplash siteConfig={siteConfig} language={language} />;
  }
}

module.exports = Index;
