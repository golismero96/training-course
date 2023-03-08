import * as React from 'react';
import {
  Typography,
  AppBar,
  Box,
  Paper,
  Skeleton,
  CssBaseline,
  Grid,
  Toolbar,
  Container,
  ButtonGroup,
  Button,
} from "@mui/material";
import PhotoCameraIcon from "@mui/icons-material/PhotoCamera";
import { makeStyles, styled } from "@mui/styles";

const useStyles = makeStyles({
  button: {
    borderRadius: 10,
    boxShadow: "0 3px 5px 2px rgba(255, 105, 75, .3)",
  },
  icon: {
    marginRight: "20px",
  },
});

const Item = styled(Paper)(() => ({
  backgroundColor: 'blue',
  padding: 1,
  textAlign: 'center',
}));

function App() {
  const classes = useStyles();

  return (
    <>
      <CssBaseline />
      <AppBar position="relative">
        <Toolbar>
          <PhotoCameraIcon className={classes.icon} />
          <Typography variant="h6">Photo Album</Typography>
        </Toolbar>
      </AppBar>
      <main>
        <div>
          <Container maxWidth="sm">
            <Typography
              variant="h2"
              align="center"
              color="textPrimary"
              gutterBottom
            >
              Photo Album
            </Typography>
            <Typography
              variant="h5"
              align="center"
              color="textSecondary"
              paragraph
            >
              Hello everyone, this is a photo album and I'm trying to make this
              sentence as long as possible so I can see how it looks on the
              screen
            </Typography>
            <Container align="center">
              <ButtonGroup
                variant="contained"
                color="success"
                aria-label="conianed primary button group"
              >
                <Button color="primary">One</Button>
                <Button>Two</Button>
                <Button color="warning">Three</Button>
              </ButtonGroup>
            </Container>

          </Container>
          <Container maxWidth="sm" align="center" spacing={1}>
            <Skeleton variant="text" sx={{ fontSize: "2rem" }} />
            {/* For other variants, adjust the size with `width` and `height` */}
            <Skeleton variant="circular" width={40} height={40} />
            <Skeleton variant="rectangular" width={210} height={60} />
            <Skeleton variant="rounded" width={210} height={60} />
            <Skeleton animation={false} width={210} height={60} />
          </Container>
        </div>
      </main>
            <Box sx={{ flexGrow: 1 }}>
          <Grid container spacing={2}>
            <Grid item xs={8}>
              <Item>xs=8</Item>
            </Grid>
            <Grid item xs={4}>
              <Item>xs=4</Item>
            </Grid>
            <Grid item xs={4}>
              <Item>xs=4</Item>
            </Grid>
            <Grid item xs={8}>
              <Item>xs=8</Item>
            </Grid>
          </Grid>
        </Box>
    </>
  );
}

export default App;
